import 'package:ass_ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ass_ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ass_ecommerce_app/features/navbar/controller/navbar_controller.dart';
import 'package:ass_ecommerce_app/features/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy initialization of controllers
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
