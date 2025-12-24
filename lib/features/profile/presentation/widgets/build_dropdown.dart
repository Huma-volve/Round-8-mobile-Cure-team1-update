import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';


Widget buildDropdown({
  required String? value,
  required List<String> items,
  required String hint,
  required ValueChanged<String?> onChanged,
  required dynamic context,
}) {
  return Container(
    height: 54, // Fixed height to match likely TextField height
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: ColorsLight.inputFill,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.transparent,
      ), // Placeholder for potential border
    ),
    child: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: items.contains(value) ? value : null,
          hint: Text(
            hint,
            style: StyleTextHelper.textStyle16Regular(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ColorsLight.textGrey, // Match other icons
            size: 20,
          ),
          isExpanded: true,
          menuMaxHeight: 300,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: Colors.white,
          style: StyleTextHelper.textStyle16Regular(context),
          items: items.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}
