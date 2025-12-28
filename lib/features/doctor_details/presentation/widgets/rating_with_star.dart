import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/functions/get_image.dart';
import 'package:flutter/material.dart';

class RatingWithStar extends StatelessWidget {
  const RatingWithStar({
    super.key,
    this.rating = 0,
    this.onChanged,
  });

  final int rating;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: onChanged == null ? null : () => onChanged!(index + 1),
          child: ratingStar(index, rating),
        );
      }),
    );
  }
}
