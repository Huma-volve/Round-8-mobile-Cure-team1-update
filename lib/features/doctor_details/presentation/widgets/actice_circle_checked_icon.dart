
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ActiveCirlcleCheckedIcon extends StatelessWidget {
  const ActiveCirlcleCheckedIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.resourceImagesActiveCheckedIcon))
      ),
      
    );
  }
}
