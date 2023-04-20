import '../../../../core/layer_abstractions/data/datasources/i_local_datasource.dart';
import '../models/splash_model.dart';

abstract class ISplashLocalDataSourceContract
    implements ILocalDataSource<SplashModel> {
  /// Gets the [SplashModel] object from the assets folder or cache.
  ///
  /// Throws [CacheException] if no cached data is present.
  @override
  Future<SplashModel> getModel();

  /// Caches the given [SplashModel] object.
  @override
  Future<void> cacheModel(SplashModel model);
}
