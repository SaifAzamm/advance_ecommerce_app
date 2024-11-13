import 'package:ass_ecommerce_app/core/helper/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension StringExtension on String {
  void toToastError(BuildContext context) {
    try {
      final message = isEmpty ? "error" : this;

      Get.snackbar(
        duration: const Duration(seconds: 1),
        "Error",
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 4.r,
      );
    } catch (e, stackTrace) {
      log.e("error $e$stackTrace");
    }
  }

  void toToastAlert(BuildContext context) {
    try {
      final message = isEmpty ? "error" : this;

      Get.snackbar(
        duration: const Duration(seconds: 1),
        "Alert",
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.amber,
        colorText: Colors.white,
        borderRadius: 4.r,
      );
    } catch (e, stackTrace) {
      log.e("error $e$stackTrace");
    }
  }

  void toToastSuccess(BuildContext context, String title) {
    try {
      final message = isEmpty ? "success" : this;

      Get.snackbar(
        duration: const Duration(seconds: 1),
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        borderRadius: 4.r,
      );
    } catch (e, stackTrace) {
      log.e("error $e$stackTrace");
    }
  }
}
