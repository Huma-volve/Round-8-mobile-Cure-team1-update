
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/select_payment_method_screen_scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class SelectPaymentMethodScreenBody extends StatelessWidget {
  const SelectPaymentMethodScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
       const SelectPaymentMethodScreenScrollableContent(),
        PriceAndBookActionFooterButton(buttonName: 'Pay',onPressed: () => context.push(AppRoute.doctorDetails),)
      ],
    );
  }
}
