
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_doctor_details_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class YourAppointmentDoctorDetails extends StatelessWidget {
  final MyBookingEntity booking;
  const YourAppointmentDoctorDetails({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final imageProvider = _resolveImage(booking.docImage);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 41.h,
              width: 43.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider),
                  borderRadius: BorderRadius.circular(35)),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.docName,
                  style: AppTextStyles.georgiaRegular16(context),
                ),
                Text(
                  booking.docSpciality,
                  style: AppTextStyles.montserratRegular14(context),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(Assets.resourceImagesMessage)
          ],
        ),
        SizedBox(
          height: 8.w,
        ),
        MyBookingDoctorDetailsLocation(docAddress: booking.docAddress)
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
