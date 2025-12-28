import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingDoctorDetailsLocation extends StatelessWidget {
  const MyBookingDoctorDetailsLocation({
    super.key,required this.docAddress
  });
final String docAddress;
  @override
  Widget build(BuildContext context) {
    final resolved = docAddress.trim().isEmpty
        ? 'Location unavailable'
        : docAddress;
    return Row(
      children: [
       SizedBox(
         height: 18.h,
         width: 18.w,
         child: Image.asset(
           Assets.resourceImagesLocation,
           color: ColorsLight.blueGray,
         )),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            resolved,
            style: AppTextStyles.montserratRegular14(context)
                .copyWith(color: ColorsLight.blueGray),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
