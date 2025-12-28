import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_doctor_details_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItemDoctorDetails extends StatelessWidget {
  const MyBookingItemDoctorDetails({
    super.key,required this.mybookItem
  });
final MyBookingEntity mybookItem;
  @override
  Widget build(BuildContext context) {
    final imageProvider = _resolveImage(mybookItem.docImage);
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 46.h,
              width: 46.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider),
                  borderRadius: BorderRadius.circular(46)),
            ),
            SizedBox(
              width: 12.r,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mybookItem.docName,
                    style: AppTextStyles.georgiaRegular16(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.r),
                  Text(
                    mybookItem.docSpciality,
                    style: AppTextStyles.montserratRegular14(context)
                        .copyWith(color: ColorsLight.blueGray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.r),
                  MyBookingDoctorDetailsLocation(
                      docAddress: mybookItem.docAddress),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

ImageProvider _resolveImage(String? url) {
  if (url == null || url.isEmpty) {
    return const AssetImage(Assets.resourceImagesDoctor);
  }
  if (!url.startsWith('http')) {
    return AssetImage(url);
  }
  return NetworkImage(url);
}
