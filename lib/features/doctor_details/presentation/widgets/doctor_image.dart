
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DoctorImage extends StatelessWidget {
  const DoctorImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        
        
        Container(
          height: 113.h,
          width: 113.w,
          decoration: BoxDecoration(
         
            borderRadius: BorderRadius.circular(60),
            image: const DecorationImage(image: AssetImage(Assets.resourceImagesDoctor))
          ),
        ),
        Positioned(
          bottom: 5.h,
          right: -6.w,
          child: Container(
            height: 24.h,
            width: 24.w,
            decoration: const BoxDecoration(
              image: DecorationImage(image: 
              AssetImage(Assets.resourceImagesCheckedImage))
            ),
          ),
        ),
      ],
    );
  }
}
