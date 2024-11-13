import 'package:ass_ecommerce_app/features/cart/view/cart_view.dart';
import 'package:ass_ecommerce_app/features/favourite/favourite_view.dart';
import 'package:ass_ecommerce_app/features/home/view/home_view.dart';
import 'package:ass_ecommerce_app/features/product/view/product_view.dart';
import 'package:ass_ecommerce_app/features/profile/view/provile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final RxList<Widget> screens = [
    const HomeView(),
    const ProductView(),
    const CartView(),
    const FavouriteView(),
    const ProfileView(),
  ].obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
