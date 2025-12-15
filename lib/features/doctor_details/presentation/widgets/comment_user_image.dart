
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentUserImage extends StatelessWidget {
  const CommentUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 62.w,
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage(Assets.resourceImagesUserComment)),
        borderRadius: BorderRadius.circular(40)
      ),
    );
  }
}