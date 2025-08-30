part of 'app_routers_import.dart';

class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RoutesName.otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
        return null;
    }
  }
}
