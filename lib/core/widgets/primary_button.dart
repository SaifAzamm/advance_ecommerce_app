import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatefulWidget {
  final String buttonText;
  final Function()? onPressed;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: Palette.linearPrimary,
          stops: [0.0, 1.0], // Match the number of colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Allow gradient to show
          shadowColor: Colors.transparent, // Remove button shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: widget.isLoading
            ? const CircularProgressIndicator(
                color: Palette.backGround, // Loading spinner color
              )
            : Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Palette.backGround, // Text color
                    ),
              ),
      ),
    );
  }
}
