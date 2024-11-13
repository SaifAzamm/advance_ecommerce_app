import 'package:ass_ecommerce_app/core/helper/get_storage_helper.dart';
import 'package:ass_ecommerce_app/core/routes/router.dart';
import 'package:ass_ecommerce_app/core/utils/ext/context.dart';
import 'package:ass_ecommerce_app/core/utils/ext/string.dart';
import 'package:ass_ecommerce_app/features/auth/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepo _authRepo = AuthRepo();
  final TextEditingController userNameController =
      TextEditingController(text: "johnd");
  final TextEditingController passwordController =
      TextEditingController(text: "m38rmF\$");
  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs;
  RxBool showPassword = false.obs;

  ///Login user ****************************************************************
  Future<void> loginUser(BuildContext context) async {
    context.show();
    final response =
        await _authRepo.login(userNameController.text, passwordController.text);
    response.fold((l) {
      context.dismiss();
      "Something went wrong".toToastError(context);
    }, (r) {
      context.dismiss();
      box.write("token", r.token);
      box.write("is_logged_in", true);
      Get.offAllNamed(AppRoutes.navbarScreen);
      "Login Successfully".toString().toToastSuccess(context, "Success");
    });
  }

  ///Validate Login
  void validateLogin({required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      debugPrint("it's working");
      loginUser(context);
    }
  }

  void updateShowPassowrd() {
    showPassword.value = !showPassword.value;
  }
}
