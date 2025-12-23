import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_bookin_screen_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
<<<<<<< HEAD
      body: BlocProvider(
        create: (context) => BookingCubit(myBookRepo: getIt<MyBookRepo>())..getBookingData(selectedData: '16'),
=======
      body: MultiBlocProvider(

        providers: [
          BlocProvider(create: (context) => BookingCubit(myBookRepo: getit<MyBookRepo>())..getBookingData(selectedData: '16'),),

   

        ],
>>>>>>> shaban
        child:const MyBookinScreenBody(),
      ),
    );
  }
}
