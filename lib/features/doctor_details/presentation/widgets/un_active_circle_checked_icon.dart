

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

class UnActiveCirlcleCheckedIcon extends StatelessWidget {
  const UnActiveCirlcleCheckedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color:ColorsLight.blueGray),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}