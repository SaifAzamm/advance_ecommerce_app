// ignore_for_file: deprecated_member_use

import 'package:ass_ecommerce_app/core/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;

    return shortestSide < 600;
  }

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  Future<dynamic> goTo(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route<dynamic> route) => false,
        arguments: args,
      );

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery.of(this).size.height * toDouble;
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        barrierDismissible: false,
        builder: (c) {
          ctx = c;

          return PopScope(
            onPopInvoked: (pop) => false,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SpinKitDoubleBounce(
                          itemBuilder: (_, i) => Image.asset(
                                Images.logo,
                                height: 20.h,
                                width: 20.w,
                              )
                          //color: Palette.primary,
                          ),
                    )),
              ),
            ),
          );
        },
      );

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
