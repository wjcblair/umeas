import '../../../core/assets/image_assets.dart';
import '../../../core/presentation/routes/route_manager.dart';

class SplashConstants {
  static const String kLogo = '${ImageAssets.kImagePath}/um_logo.png';
  static const int kDelay = 3;
  static const int kSplashFailureDuration = 5;
  static const String kNextRoute = Routes.auth;
}
