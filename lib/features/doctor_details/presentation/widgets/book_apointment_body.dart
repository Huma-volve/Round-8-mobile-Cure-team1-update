import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_state.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_scrollable_content.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookApointmentBody extends StatefulWidget {
  const BookApointmentBody({
    super.key,
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
               context.push(AppRoute.selectPaymentMethodScreen);
            }else if(state is CreateBookFailureState)
            {
              messageForUser(context: context, errorMessage: state.errorMessage);
            }
          },
          builder: (context, state) {
           
            return PriceAndBookActionFooterButton(
              loadingState: state is CreateBookLoadingState?true:false,
                buttonName:'Continue to Pay',
                onPressed: () {
                  if(appointmentDate !=null && appointmentTime==null)
                  {
                    messageForUser(context: context, errorMessage: 'please select appointment time');
                  }
                  else if (appointmentDate != null&& appointmentTime!=null) {
                    context.read<CreateBookCubit>().create(
                        doctorId: 4,
                        appointmentDate: appointmentDate!,
                        appointmentTime: appointmentTime!);
                  } else {
                    context.push(AppRoute.selectPaymentMethodScreen);
                  }
                });
          },
        )
      ],
    );
  }
}
