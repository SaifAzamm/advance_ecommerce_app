import 'package:ass_ecommerce_app/core/config/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.title,
    this.curFocusNode,
    this.nextFocusNode,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
    this.semantic,
    this.labelText,
    this.focusBorderColor,
    this.radius,
    this.height,
    this.readOnly,
    this.showCursor,
    this.textStyle,
    this.contentHorizontalPadding,
    this.contentVerticalPadding,
    this.maxLength,
    this.autofocus,
    this.textCapitalization,
  });

  final String? title;
  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? labelText;
  final Function(String?)? validator;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final String? semantic;
  final Color? focusBorderColor;
  final double? radius;
  final double? height;
  final bool? showCursor;
  final bool? readOnly;
  final bool? autofocus;
  final TextStyle? textStyle;
  final double? contentHorizontalPadding;
  final double? contentVerticalPadding;
  final int? maxLength;
  final TextCapitalization? textCapitalization;

  @override
  TextFState createState() => TextFState();
}

class TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Text(
                widget.title ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : const SizedBox(),
        widget.title != null ? SizedBox(height: 10.h) : const SizedBox(),
        TextFormField(
          autofocus: widget.autofocus ?? false,
          readOnly: widget.readOnly ?? false,
          key: widget.key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: widget.autofillHints,
          enabled: widget.enable,
          obscureText: widget.obscureText ?? false,
          focusNode: widget.curFocusNode,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          textAlign: widget.textAlign ?? TextAlign.start,
          minLines: widget.minLine ?? 1,
          maxLines: widget.maxLine ?? 1,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatter,
          textAlignVertical: TextAlignVertical.center,
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
          cursorColor: Palette.primary,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
            filled: true,
            errorMaxLines: 3,
            fillColor: Palette.backGround,
            focusColor: Colors.white,
            prefixText: widget.prefixText,
            alignLabelWithHint: true,
            isDense: true,
            hintText: widget.hintText,
            helperStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Palette.hintText.withOpacity(.4)),
            labelText: widget.labelText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Rubik',
              color: Palette.hintText,
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.contentVerticalPadding ?? 15.h,
              horizontal: widget.contentHorizontalPadding ?? 20.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
              borderSide: const BorderSide(color: Palette.textFBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
              borderSide: const BorderSide(color: Palette.textFBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
              borderSide: const BorderSide(color: Palette.textFBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
              borderSide: const BorderSide(color: Palette.primary),
            ),
          ),
          validator: widget.validator as String? Function(String?)?,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onFieldSubmitted: (value) {
            if (widget.curFocusNode != null && widget.nextFocusNode != null) {
              fieldFocusChange(
                context,
                widget.curFocusNode!,
                widget.nextFocusNode,
              );
            }
          },
        ),
      ],
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
