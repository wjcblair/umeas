import 'package:dartz/dartz.dart';
import 'package:umeas/features/inbox/domain/entities/message.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../auth/domain/entities/email_provider.dart';

abstract class IInboxRepositoryContract {
  Future<Either<AppFailure, List<Message>>> fetchMessages(
      EmailProvider provider);
}
