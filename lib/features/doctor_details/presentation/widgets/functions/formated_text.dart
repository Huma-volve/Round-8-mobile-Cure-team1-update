import 'package:flutter/material.dart';

String formattedTimeOfDay()
{
  return '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}';
}
String formattedSelectedTime(TimeOfDay selectedTime)
{
  return '${selectedTime.hour}:${selectedTime.minute}';
}