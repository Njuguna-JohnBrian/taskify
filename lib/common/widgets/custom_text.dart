import 'package:flutter/material.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    required this.controller,
    this.onChanged,
  });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConsts.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConsts.kLight,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppConsts.kRadius,
          ),
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appstyle(
          18,
          AppConsts.kBkDark,
          FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConsts.kBkDark,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConsts.kRed,
              width: 0.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConsts.kRed,
              width: 0.5,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConsts.kGreyDK,
              width: 0.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConsts.kBkDark,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
