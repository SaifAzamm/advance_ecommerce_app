import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:ass_ecommerce_app/core/error/validator.dart';
import 'package:ass_ecommerce_app/core/resources/images.dart';
import 'package:ass_ecommerce_app/core/widgets/custom_textf.dart';
import 'package:ass_ecommerce_app/core/widgets/primary_button.dart';
import 'package:ass_ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 170.h),
                  Image.asset(
                    Images.logo,
                    height: 60.h,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome Back!',
                    style: textTheme.titleMedium,
                  ),
                  SizedBox(height: 20.h),
                  TextF(
                    controller: controller.userNameController,
                    labelText: "User",
                    hintText: "JohnSnow@",
                    validator: (v) => Validators.validateUsername(v),
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => TextF(
                      controller: controller.passwordController,
                      labelText: "Password",
                      hintText: "Enter password",
                      obscureText: !controller.showPassword.value,
                      validator: (v) => Validators.validatePassword(v),
                      suffixIcon: IconButton(
                          onPressed: () => controller.updateShowPassowrd(),
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: textTheme.bodySmall?.copyWith(
                            color: Palette.secondary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) {
                                  controller.rememberMe.value = value!;
                                },
                              )),
                          Text(
                            'Remember me',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                      buttonText: "Sign In",
                      onPressed: () =>
                          controller.validateLogin(context: context)),
                  SizedBox(height: 20.h),
                  Text(
                    'Or Sign in with social account',
                    style: textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Images.googleLogo,
                          height: 50.h,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Images.facebookLogo,
                          height: 35.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
