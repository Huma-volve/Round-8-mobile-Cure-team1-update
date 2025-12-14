import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputExample extends StatelessWidget {
  const PhoneInputExample({super.key});

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
      ),
      selectorTextStyle: const TextStyle(fontSize: 0),
      spaceBetweenSelectorAndTextField: 0.0,
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: TextEditingController(),
      formatInput: false,
      inputDecoration: const InputDecoration(
        hintText: 'Enter your number',
        border: InputBorder.none,
        filled: true,
        fillColor: ColorsLight.textFieldColoe,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
