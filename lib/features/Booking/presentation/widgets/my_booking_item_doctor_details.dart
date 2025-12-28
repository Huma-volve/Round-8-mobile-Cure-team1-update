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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mybookItem.docName,
                          style: AppTextStyles.georgiaRegular16(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (mybookItem.bookId > 0) ...[
                        SizedBox(width: 8.r),
                        _BookingIdBadge(id: mybookItem.bookId),
                      ],
                    ],
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

class _BookingIdBadge extends StatelessWidget {
  const _BookingIdBadge({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r),
      decoration: BoxDecoration(
        color: ColorsLight.royalBlue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsLight.royalBlue.withOpacity(0.2)),
      ),
      child: Text(
        'ID #$id',
        style: AppTextStyles.montserratMedum12(context).copyWith(
          color: ColorsLight.royalBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
