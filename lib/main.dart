import 'package:ass_ecommerce_app/core/resources/app_theme.dart';
import 'package:ass_ecommerce_app/core/routes/router.dart';
import 'package:ass_ecommerce_app/core/routes/routes.dart';
import 'package:ass_ecommerce_app/binding/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  Future.delayed(const Duration(seconds: 1), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, __) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          initialRoute: AppRoutes.splashScreen,
          title: 'Ecommerce-App',
          theme: ApplicationTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
        );
      },
    );
  }
}
