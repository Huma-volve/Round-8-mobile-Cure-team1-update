import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_state.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingScreenBodyBlocConsumer extends StatelessWidget {
  const MyBookingScreenBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocConsumer<BookingCubit,BookingState>(
      
      listener: (context, state) {
        if(state is BookingFailureState)
        {
          messageForUser(context: context, errorMessage: state.errorMessege);
        }
      },
      builder: (context, state) {
        if (state is BookingSuccessState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.myBooks.length,
              itemBuilder: (context, index) => MyBookingItem(
                mybookItem: state.myBooks[index],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );}, );
    
    
    
      
  }
}

void messageForUser(
    {required BuildContext context, required String errorMessage}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(errorMessage)));
}
