import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_new_card_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/appointment_and_reschedual_widge.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/payment_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';

class SelectPaymentMethodScreenScrollableContent extends StatelessWidget {
  const SelectPaymentMethodScreenScrollableContent({
    super.key,
    this.data,
    this.selectedGateway,
    this.onMethodSelected,
  });
  final BookingFlowData? data;
  final String? selectedGateway;
  final ValueChanged<PaymentMethodModel>? onMethodSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              const DoctorDetailsAppBar(
                title: 'Book Appointment',
                ismessageIconEnable: false,
              ),
              SizedBox(
                height: 35.h,
              ),
              DoctorDetailsWidget(doctor: data?.doctor),
              SizedBox(
                height: 32.h,
              ),
              ApointMentAndReschedualWidget(
                appointmentDate: data?.appointmentDate,
                appointmentTime: data?.appointmentTime,
              ),
              SizedBox(
                height: 49.h,
              ),
              PaymentMethodItems(
                initialIndex: _resolveSelectedIndex(selectedGateway),
                onSelected: onMethodSelected,
              ),
              SizedBox(
                height: 8.h,
              ),
              const AddNewCardWidge()
            ],
          ),
        ),
      ],
    );
  }
}

int _resolveSelectedIndex(String? gateway) {
  if (gateway == null) {
    return 0;
  }
  final index =
      paymentItemsList.indexWhere((method) => method.gateway == gateway);
  return index == -1 ? 0 : index;
}
