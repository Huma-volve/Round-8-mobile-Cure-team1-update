import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_item_screen_body.dart';
import 'package:flutter/material.dart';

class MyBookItemScreen extends StatelessWidget {
  const MyBookItemScreen({super.key, required this.mybookingModel});
  final MybookingModel mybookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBookItemScreenBody(
        mybookingModel: mybookingModel,
      ),
    );
  }
}
