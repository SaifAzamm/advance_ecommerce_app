import 'package:ass_ecommerce_app/core/utils/ext/context.dart';
import 'package:ass_ecommerce_app/core/utils/ext/string.dart';
import 'package:ass_ecommerce_app/features/home/data/repository/home_repo.dart';
import 'package:ass_ecommerce_app/features/home/data/response/get_product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo = HomeRepo();
  RxList<String> categoryList = <String>[].obs;
  RxList<GetProductResponse> productList = <GetProductResponse>[].obs;
  RxList<String> categoryUrls = <String>[
    'https://www.shutterstock.com/shutterstock/photos/2174606243/display_1500/stock-photo-flat-lay-composition-with-camera-and-video-production-equipment-on-black-background-space-for-text-2174606243.jpg',
    'https://www.shutterstock.com/shutterstock/photos/2165133449/display_1500/stock-photo-hand-of-beautiful-woman-wearing-stylish-jewellery-on-lilac-background-with-space-for-text-2165133449.jpg',
    'https://www.shutterstock.com/shutterstock/photos/2044374842/display_1500/stock-photo-group-of-successful-confident-business-people-in-smart-and-casual-wear-standing-in-studio-team-of-2044374842.jpg',
    'https://www.shutterstock.com/shutterstock/photos/551997871/display_1500/stock-photo-banner-horizontal-crop-for-text-background-of-clothing-rack-clothes-for-women-hanging-on-hangers-551997871.jpg'
  ].obs;

  ///Get Cagtegories****************************************************************
  Future<void> getCategories() async {
    Get.context!.show();
    final response = await _homeRepo.getCategorires();
    response.fold((l) {
      Get.context!.dismiss();
      "Something went wrong".toToastError(Get.context!);
    }, (r) {
      categoryList.value = r;
      Get.context!.dismiss();
    });
  }

  ///Get Products****************************************************************

  Future<void> getProducts() async {
    final response = await _homeRepo.getProducts();
    response.fold((l) {
      "Something went wrong".toToastError(Get.context!);
    }, (r) {
      productList.value = r; // Update entire list of products.
    });
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCategories();
      getProducts();
    });
    super.onInit();
  }
}
