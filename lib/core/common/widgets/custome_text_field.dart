import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  const CustomeTextField({
    super.key,
    required this.text,
    this.perfixIcon,
    this.suffixIcon,
    this.focusnode,
    this.function,
    this.onfieldsumitted,
    required this.controller,
  });
  final String text;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusnode;
  final TextEditingController controller;
  final void Function(String)? function;
  final Function(String)? onfieldsumitted;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsLight.offWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextFormField(
          onFieldSubmitted: widget.onfieldsumitted,
          onChanged: widget.function,
          focusNode: widget.focusnode,
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          autofocus: false,
          decoration: InputDecoration(
            hintText: widget.text,
            hintStyle: AppTextStyles.styleLarge20(context),
            prefixIcon: widget.perfixIcon,
            suffixIcon: widget.suffixIcon,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
