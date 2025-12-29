import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputExample extends StatelessWidget {
  const PhoneInputExample({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'EG');

    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DROPDOWN,
        useEmoji: true,
        showFlags: true,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 12,
        trailingSpace: false,
      ),
      selectorTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorsLight.textMain,
      ),
      spaceBetweenSelectorAndTextField: 0.0,
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      countries: const ['EG'],
      textFieldController: controller,
      formatInput: false,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsLight.textMain,
      ),
      inputDecoration: const InputDecoration(
        hintText: 'Enter your number',
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: ColorsLight.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: ColorsLight.primaryColor, width: 1.2),
        ),
        filled: true,
        fillColor: ColorsLight.textFieldColoe,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
