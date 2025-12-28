import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_state.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_scrollable_content.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';

class BookApointmentBody extends StatefulWidget {
  final ApiDoctor? doctor;
  const BookApointmentBody({
    super.key,
    this.doctor,
  });

  @override
  State<BookApointmentBody> createState() => _BookApointmentBodyState();
}

class _BookApointmentBodyState extends State<BookApointmentBody> {
  String? appointmentTime;

  String? appointmentDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BookAppointementScrollableContent(
          doctor: widget.doctor,
          onSelectBookTime: (selectedTime) {
            setState(() {
              appointmentTime = selectedTime;
            });
          },
          onSelectedBookData: (selectedDate) {
            setState(() {
              appointmentDate = selectedDate;
            });
          },
        ),
        BlocConsumer<CreateBookCubit, CreateBookState>(
          listener: (context, state) {
            if(state is CreateBookSuccessState)
            {
               if (widget.doctor != null) {
                 context.push(
                   AppRoute.selectPaymentMethodScreen,
                   extra: BookingFlowData(
                     doctor: widget.doctor!,
                     bookingId: state.bookingId,
                     appointmentDate: appointmentDate,
                     appointmentTime: appointmentTime,
                   ),
                 );
               } else {
                 messageForUser(
                     context: context,
                     errorMessage: 'Doctor data is missing.');
               }
            }else if(state is CreateBookFailureState)
            {
              messageForUser(context: context, errorMessage: state.errorMessage);
            }
          },
          builder: (context, state) {
           
            return PriceAndBookActionFooterButton(
              loadingState: state is CreateBookLoadingState?true:false,
                buttonName:'Continue to Pay',
                price: widget.doctor?.sessionPrice,
                onPressed: () {
                  if (widget.doctor == null || widget.doctor!.id == 0) {
                    messageForUser(
                        context: context,
                        errorMessage: 'Doctor data is missing.');
                    return;
                  }
                  final token = Cachehelper.getToken();
                  if (token == null || token.isEmpty) {
                    messageForUser(
                        context: context,
                        errorMessage: 'Please log in to book an appointment.');
                    return;
                  }
                  if(appointmentDate !=null && appointmentTime==null)
                  {
                    messageForUser(context: context, errorMessage: 'please select appointment time');
                  }
                  else if (appointmentDate != null&& appointmentTime!=null) {
                    context.read<CreateBookCubit>().create(
                        doctorId: widget.doctor!.id,
                        appointmentDate: appointmentDate!,
                        appointmentTime: appointmentTime!);
                  } else {
                    messageForUser(
                        context: context,
                        errorMessage: 'please select appointment date');
                  }
                });
          },
        )
      ],
    );
  }
}
