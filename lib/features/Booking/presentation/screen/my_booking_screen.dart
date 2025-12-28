
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_bookin_screen_body.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingScreen extends StatefulWidget {
  final bool isActive;
  const MyBookingScreen({super.key, required this.isActive});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  late final BookingCubit _bookingCubit =
      BookingCubit(myBookRepo: getIt.get<MyBookRepo>());
  bool _wasActive = false;

  @override
  void initState() {
    super.initState();
    _maybeFetch();
  }

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _maybeFetch();
  }

  void _maybeFetch() {
    if (!widget.isActive) {
      _wasActive = false;
      return;
    }
    if (_wasActive) {
      return;
    }
    _wasActive = true;
    _bookingCubit.getBookingData();
  }

  @override
  void dispose() {
    _bookingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _bookingCubit,
        child: const MyBookinScreenBody(),
      ),
    );
  }
}
