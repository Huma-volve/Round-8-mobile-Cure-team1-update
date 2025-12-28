import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/select_payment_method_screen_body.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  final BookingFlowData? data;
  const SelectPaymentMethodScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectPaymentMethodScreenBody(data: data),
    );
  }
}
