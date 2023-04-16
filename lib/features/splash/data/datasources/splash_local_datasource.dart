import 'package:umeas/features/splash/constants/splash_constants.dart';
import 'package:umeas/features/splash/data/models/splash_model.dart';

import 'i_splash_local_datasource.dart';

class SplashLocalDataSource implements ISplashLocalDataSourceContract {
  @override
  Future<void> cacheModel(SplashModel model) async {}

  @override
  Future<SplashModel> getModel() {
    return Future.value(SplashModel.fromConstants(
      SplashConstants.kLogo,
      SplashConstants.kDelay,
      SplashConstants.kNextRoute,
    ));
  }
}
