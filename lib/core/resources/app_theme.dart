import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Palette.backGround,
    fontFamily: 'Rubik',
    iconTheme: const IconThemeData(color: Palette.blackText),
    dividerTheme: const DividerThemeData(color: Palette.lightGrey),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.backGround,
      centerTitle: true,
      iconTheme: IconThemeData(color: Palette.primary, size: 20.sp),
      actionsIconTheme: IconThemeData(color: Palette.secondary, size: 22.sp),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        color: Palette.primary,
        fontWeight: FontWeight.bold,
        fontFamily: "Rubik",
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Palette.primary),
      checkColor: WidgetStateProperty.all(Palette.secondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(
          color: Palette.iconDisable,
          width: 1.w,
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(Palette.secondary),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return Palette.secondary.withOpacity(0.04);
        }
        if (states.contains(WidgetState.focused) ||
            states.contains(WidgetState.pressed)) {
          return Palette.secondary.withOpacity(0.12);
        }
        return null;
      }),
    ),
    dividerColor: Palette.lightGrey,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28.sp,
        color: Palette.primary,
        fontWeight: FontWeight.bold, // Corrected
        fontFamily: "Rubik",
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        color: Palette.primary,
        fontWeight: FontWeight.bold, // Corrected
        fontFamily: "Rubik",
      ),
      titleSmall: TextStyle(
        fontSize: 22.sp,
        color: Palette.primary,
        fontWeight: FontWeight.bold, // Corrected
        fontFamily: "Rubik",
      ),
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        color: Palette.primary,
        fontWeight: FontWeight.w500, // Corrected for medium
        fontFamily: "Rubik",
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        color: Palette.primary,
        fontWeight: FontWeight.w500, // Corrected for medium
        fontFamily: "Rubik",
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w400, // Corrected for regular
        fontFamily: "Rubik",
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: Palette.blackText,
        fontWeight: FontWeight.w400, // Corrected for regular
        fontFamily: "Rubik",
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: Palette.hintText,
        fontWeight: FontWeight.w400, // Corrected for regular
        fontFamily: "Rubik",
      ),
    ),
  );
}
