import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:ass_ecommerce_app/features/navbar/controller/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<NavbarView> {
  final NavbarController controller = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.iconDisable,
          backgroundColor: Palette.backGround,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.onItemTapped(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}









