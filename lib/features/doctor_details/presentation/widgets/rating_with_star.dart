import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/functions/get_image.dart';
import 'package:flutter/material.dart';

class RatingWithStar extends StatefulWidget {
  const RatingWithStar({super.key});

  @override
  State<RatingWithStar> createState() => _RatingWithStarState();
}

class _RatingWithStarState extends State<RatingWithStar> {
  List<int> activeStar = [];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: emptyStar.asMap().entries.map((e) {
        return GestureDetector(
            onTap: () {
              setState(() {
                activeStar.add(e.key);
              });
            },
            child: getimage(e.key, activeStar));
      }).toList(),
    );
  }
}

List<String> emptyStar = [
  Assets.resourceImagesInActiveStar,
  Assets.resourceImagesInActiveStar,
  Assets.resourceImagesInActiveStar,
  Assets.resourceImagesInActiveStar,
  Assets.resourceImagesInActiveStar,
];
