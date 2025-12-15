

import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/appoint_ment_warning.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_appbar.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date_and_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookItemScreenBody extends StatelessWidget {
  const MyBookItemScreenBody({super.key, required this.mybookingModel});
final MybookingModel mybookingModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        children: [
          SizedBox( 
               height: 24.r,),

        const  MyBookAppbar(title: 'Your Appointment'),

         SizedBox(
        height: 40.r,
       ),
    
       const  AppointmentWarning(),
       SizedBox(
        height: 24.r,
       ),
     
       Expanded(child: YourAppointmentDateAndDoctorDetails(mybookingModel: mybookingModel))
      
        ],
      ),
    );
  }
}
