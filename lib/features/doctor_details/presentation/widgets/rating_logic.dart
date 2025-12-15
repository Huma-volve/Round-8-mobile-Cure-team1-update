
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';

class RatingLogic extends StatelessWidget {
  const RatingLogic({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index){
        if(index+1<rate)
        {
        return Image.asset(Assets.resourceImagesActiveStar);
        }
       return Image.asset(Assets.resourceImagesInActiveStar);
      }),
    );
  }
}
