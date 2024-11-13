import 'package:ass_ecommerce_app/core/routes/router.dart';
import 'package:ass_ecommerce_app/features/auth/view/login_view.dart';
import 'package:ass_ecommerce_app/features/home/view/home_view.dart';
import 'package:ass_ecommerce_app/features/navbar/view/navbar_view.dart';
import 'package:ass_ecommerce_app/features/splash/view/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRouter {
  static List<GetPage<dynamic>> routes = [
    //Splash screen
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    //Login screen
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    //Home screen
    GetPage(
      name: AppRoutes.navbarScreen,
      page: () => const NavbarView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
    ),
  ];
}
