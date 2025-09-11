part of 'app_routers_import.dart';

class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RoutesName.otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen(args: args));
      case RoutesName.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
      case RoutesName.businessesScreen:
        return MaterialPageRoute(builder: (_) => const BusinessesScreen());
      case RoutesName.yourBusinessesScreen:
        return MaterialPageRoute(builder: (_) => const YourBusinessesScreen());
      case RoutesName.initiateBusinessScreen:
        return MaterialPageRoute(
          builder: (_) => const InitiateBusinessScreen(),
        );
      case RoutesName.mapScreen:
        return MaterialPageRoute(builder: (_) => const MapScreen());
      default:
        return null;
    }
  }
}
