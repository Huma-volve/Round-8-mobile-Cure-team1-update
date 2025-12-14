import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/responsive_size.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsLight.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              AppTextStyles.styleSmall6.copyWith(color: ColorsLight.offWhite),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsLight.inputFill,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        style: AppTextStyles.styleSmall6.copyWith(
          color: const Color.fromARGB(255, 141, 143, 148),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.styleLarge18(context),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 4.w,
          ),
          prefixIcon: prefixWidget ??
              (prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: ColorsLight.textGrey,
                      size: 10.sp,
                    )
                  : null),
          suffixIcon:
              suffixIcon, // Suffix widget sizing handled by caller or default
        ),
      ),
    );
  }
}

// SettingsTile might be used? I'll refactor just in case.
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: (iconColor ?? ColorsLight.primaryColor).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child:
            Icon(icon, color: iconColor ?? ColorsLight.textMain, size: 20.sp),
      ),
      title: Text(
        title,
        style: AppTextStyles.styleLarge20(context).copyWith(
          fontWeight: FontWeight.w500,
          fontSize: responsive_size(context, fontsize: 16),
        ),
      ),
      trailing: trailing ??
          Icon(Icons.chevron_right, color: ColorsLight.textGrey, size: 24.sp),
    );
  }
}
