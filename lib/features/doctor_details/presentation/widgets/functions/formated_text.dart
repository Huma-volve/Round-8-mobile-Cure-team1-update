import 'package:flutter/material.dart';

String formattedTimeOfDay()
{
  final now = TimeOfDay.now();
  return '${_twoDigits(now.hour)}:${_twoDigits(now.minute)}';
}
String formattedSelectedTime(TimeOfDay selectedTime)
{
  return '${_twoDigits(selectedTime.hour)}:${_twoDigits(selectedTime.minute)}';
}

String _twoDigits(int value) => value.toString().padLeft(2, '0');
