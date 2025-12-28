import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoLocation extends StatelessWidget {
  final String? location;
  const DoctorInfoLocation({
    super.key,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 18.r,
          width: 18.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.resourceImagesLocation))),
        ),
        SizedBox(width: 6.r),
        Expanded(
          child: Text(
            location?.isNotEmpty == true ? location! : 'Location unavailable',
            style: AppTextStyles.montserratRegular14(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
