import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ass_ecommerce_app/core/config/pallet.dart'; // Adjust the path if necessary

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          // Scan Icon
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {},
            color: Palette.secondary,
            iconSize: 28.sp,
          ),

          // Search Bar
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Palette.hintText, fontSize: 14.sp),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Palette.hintText),
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide()),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.secondary)),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {},
            color: Palette.blackText,
            iconSize: 28.sp,
          ),
        ],
      ),
    );
  }
}
