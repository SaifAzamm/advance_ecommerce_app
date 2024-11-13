import 'package:ass_ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ass_ecommerce_app/features/home/widgets/banner_slider.dart';
import 'package:ass_ecommerce_app/features/home/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchRow(),
              const BannerSlider(),
              SizedBox(height: 20.h),

              // Categories Section
              _buildSectionTitle("Categories"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  height: 65.h,
                  child: Obx(() {
                    if (controller.categoryList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryList.length,
                      itemBuilder: (context, index) {
                        final category = controller.categoryList[index];
                        return _buildCategoryItem(
                          category,
                          controller.categoryUrls[index],
                        );
                      },
                    );
                  }),
                ),
              ),

              SizedBox(height: 20.h),

              // Trending Section (Static for now)
              _buildSectionTitle("Trending"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) => _buildProductItem(
                          controller.productList[index].image ?? "",
                          controller.productList[index].title ?? "",
                          "12\$",
                          true),
                    )
                    //  ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [
                    //
                    //     _buildProductItem("Casual Shirt", "10\$", false),
                    //   ],
                    // ),
                    ),
              ),

              SizedBox(height: 20.h),

              // Sale Section
              _buildSectionTitle("Sale"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SizedBox(
                  height: 200.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildProductItem("", "Winter Coat", "20\$", true,
                          sale: true),
                      _buildProductItem("", "Summer Hat", "8\$", false,
                          sale: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("See All"),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imageUrl) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Palette.primary.withOpacity(0.1),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          height: 65.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Center(
            child: Text(
              name.capitalizeFirst!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(
      String url, String name, String price, bool isFavorite,
      {bool sale = false}) {
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Palette.backGround,
        border: Border.all(color: Palette.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(url,
                  height: 100.h, width: 140.w, fit: BoxFit.cover),
              if (sale)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    color: Colors.red,
                    child: const Text(
                      "20% OFF",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            child: Text(name,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(price,
                style: TextStyle(fontSize: 12.sp, color: Palette.secondary)),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.primary,
                textStyle: TextStyle(fontSize: 12.sp),
              ),
              child: const Text("Add to cart"),
            ),
          ),
        ],
      ),
    );
  }
}
