// ignore_for_file: unused_local_variable

import 'package:ass_ecommerce_app/core/resources/images.dart';
import 'package:ass_ecommerce_app/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();
    return Scaffold(
      body: Center(child: Image.asset(Images.logo)),
    );
  }
}
