import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:umeas/core/data/exceptions/cache_exception.dart';
import 'package:umeas/core/data/exceptions/server_exception.dart';
import 'package:umeas/core/domain/failures/cache_failure.dart';
import 'package:umeas/core/domain/failures/server_failure.dart';
import 'package:umeas/core/network/i_network_info_contract.dart';
import 'package:umeas/features/inbox/data/datasources/local/i_inbox_local_datasource_contract.dart';
import 'package:umeas/features/inbox/data/datasources/remote/i_inbox_remote_datasource_contract.dart';
import 'package:umeas/features/inbox/data/models/message_model.dart';
import 'package:umeas/features/inbox/data/repositories/inbox_repository.dart';

class MockRemoteDataSource extends Mock
    implements IInboxRemoteDatasourceContract {}

class MockLocalDataSource extends Mock
    implements IInboxLocalDatasourceContract {}

class MockNetworkInfo extends Mock implements INetworkInfoContract {}

void main() {
  late InboxRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = InboxRepository(
      localDatasource: mockLocalDataSource,
      remoteDatasource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );

    void runTestsOnline(Function body) {
      group('device is online', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        body();
      });
    }

    void runTestsOffline(Function body) {
      group('device is offline', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
        });
        body();
      });
    }

    group('getEmails', () {
      const tSender = 'testSender@test.com';
      const tSubject = 'testSubject';
      final tDate = DateTime.now();
      const tBody = 'testBody';
      final tEmailModel = MessageModel(
        sender: tSender,
        subject: tSubject,
        date: tDate,
        body: tBody,
      );
      final tEmails = [tEmailModel];
      test(
        'should check if the device is online',
        () async {
          // Arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockRemoteDataSource.fetchMessages())
              .thenAnswer((_) async => tEmails);
          when(() => mockLocalDataSource.cacheMessages(any()))
              // ignore: avoid_returning_null_for_void
              .thenAnswer((_) async => null);

          // Act
          await repository.fetchMessages();

          // Assert
          verify(() => mockNetworkInfo.isConnected);
        },
      );

      runTestsOnline(() {
        test(
          'should return remote data when the call to remote data source is successful',
          () async {
            // Arrange
            when(() => mockRemoteDataSource.fetchMessages())
                .thenAnswer((_) async => tEmails);
            when(() => mockLocalDataSource.cacheMessages(any()))
                // ignore: avoid_returning_null_for_void
                .thenAnswer((_) async => null);

            // Act
            final result = await repository.fetchMessages();

            // Assert
            verify(() => mockRemoteDataSource.fetchMessages());
            expect(result, Right(tEmails));
          },
        );

        test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
            // Arrange
            when(() => mockRemoteDataSource.fetchMessages())
                .thenAnswer((_) async => tEmails);
            when(() => mockLocalDataSource.cacheMessages(any()))
                // ignore: avoid_returning_null_for_void
                .thenAnswer((_) async => null);

            // Act
            await repository.fetchMessages();

            // Assert
            verify(() => mockRemoteDataSource.fetchMessages());
            verify(() => mockLocalDataSource.cacheMessages(tEmails));
          },
        );

        test(
          'should return ServerFailure when the call to remote data source is unsuccessful',
          () async {
            // Arrange
            when(() => mockRemoteDataSource.fetchMessages())
                .thenThrow(ServerException());

            // Act
            final result = await repository.fetchMessages();

            // Assert
            verify(() => mockRemoteDataSource.fetchMessages());
            verifyZeroInteractions(mockLocalDataSource);
            expect(result, Left(ServerFailure()));
          },
        );
      });

      runTestsOffline(() {
        test(
          'should return last locally cached data when the cached data is present',
          () async {
            // Arrange
            when(() => mockLocalDataSource.fetchMessages())
                .thenAnswer((_) async => tEmails);

            // Act
            final result = await repository.fetchMessages();

            // Assert
            verifyZeroInteractions(mockRemoteDataSource);
            verify(() => mockLocalDataSource.fetchMessages());
            expect(result, equals(Right(tEmails)));
          },
        );

        test(
          'should return CacheFailure data when there is no cached data is present',
          () async {
            // Arrange
            when(() => mockLocalDataSource.fetchMessages())
                .thenThrow(const CacheException());

            // Act
            final result = await repository.fetchMessages();

            // Assert
            verifyZeroInteractions(mockRemoteDataSource);
            verify(() => mockLocalDataSource.fetchMessages());
            expect(result, Left(CacheFailure()));
          },
        );
      });
    });
  });
}
