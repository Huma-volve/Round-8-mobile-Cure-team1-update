
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_scrallable_content.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DoctorDetailsScreenBody extends StatelessWidget {
  const DoctorDetailsScreenBody({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
         const  DoctorDetailsScreenScrollableContent(),
           PriceAndBookActionFooterButton(buttonName: 'Book Appointment',onPressed:()=> context.push(AppRoute.bookappointment),)
        ],
      
    );
  }
}
