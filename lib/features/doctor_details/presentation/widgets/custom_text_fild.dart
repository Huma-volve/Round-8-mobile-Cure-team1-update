import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({
    super.key,
    this.controller,
    this.hintText = 'Write your review',
    this.maxLines = 8,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.montserratMedum14(context)
              .copyWith(color: ColorsLight.coolGrey),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: ColorsLight.coolGrey),
      borderRadius: BorderRadius.circular(15));
}
