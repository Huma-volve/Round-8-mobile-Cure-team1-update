import 'package:cure_team_1_update/features/Booking/presentation/widgets/dialog_background.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/function/show_dialog_implement.dart';
import 'package:flutter/material.dart';

class BookingActionButton extends StatelessWidget {
  const BookingActionButton({
    super.key,
    required this.bottonName,
    required this.isCnaceledButton, required this.bookId,
  });
  final String bottonName;
  final bool isCnaceledButton;
  final int bookId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogImplement( context: context, bookId: bookId);
      },
      child: DialogBackground(
          isCnaceledButton: isCnaceledButton, bottonName: bottonName),
    );
  }
}
