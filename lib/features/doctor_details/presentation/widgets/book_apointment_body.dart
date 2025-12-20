import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_scrollable_content.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookApointmentBody extends StatelessWidget {
  const BookApointmentBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BookAppointementScrollableContent(),
        PriceAndBookActionFooterButton(
          buttonName: 'Continue to Pay',
          onPressed: () => context.push(AppRoute.selectPaymentMethodScreen),
        )
      ],
    );
  }
}
