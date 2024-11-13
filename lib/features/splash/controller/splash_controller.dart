import 'dart:async';

import 'package:ass_ecommerce_app/core/helper/get_storage_helper.dart';
import 'package:ass_ecommerce_app/core/routes/router.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> initialFunction() async {
    // debugPrint(box.read("is_logged_in"));
    if (box.read("is_logged_in") != null && box.read("is_logged_in")) {
      Get.offAllNamed(AppRoutes.navbarScreen);
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      initialFunction();
    });
    super.onInit();
  }
}
