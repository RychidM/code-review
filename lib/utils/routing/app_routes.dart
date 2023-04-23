import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:stock_savvy/utils/routing/route_constants.dart';

import '../../features/auth/auth_view.dart';
import '../../features/home/home_view.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/onboarding/splash_screen.dart';

class AppRoutes {
  static List<GetPage> appViews = [
    GetPage(
        name: RouteConstants.sInitialRoute, page: () => const SplashScreen()),
    GetPage(name: RouteConstants.sAuthRoute, page: () => const AuthView()),
    GetPage(name: RouteConstants.sHomeRoute, page: () => const HomeView()),
    GetPage(
        name: RouteConstants.sOnBoardingRoute,
        page: () => const OnBoardingView())
  ];
}
