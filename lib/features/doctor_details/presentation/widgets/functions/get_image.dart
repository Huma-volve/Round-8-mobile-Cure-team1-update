import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';

Widget ratingStar(int index, int rating) {
  if (index < rating) {
    return Image.asset(Assets.resourceImagesActiveStar);
  }
  return Image.asset(Assets.resourceImagesInActiveStar);
}
