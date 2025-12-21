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
    required this.controller,
    this.isPassword = false,
  });
  final String text;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusnode;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

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
          focusNode: widget.focusnode,
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          obscureText: obscureText,
          autofocus: false,
          decoration: InputDecoration(
            hintText: widget.text,
            hintStyle: AppTextStyles.styleLarge20(context),
            prefixIcon: widget.perfixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
