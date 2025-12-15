
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_image.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 12.w),
          child: const DoctorImage(),
        ),
         SizedBox(width: 16.w,),
        const DoctorInfo()
      ],
    );
  }
}

