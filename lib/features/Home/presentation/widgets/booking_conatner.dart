import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BookingConatner extends StatelessWidget {
  const BookingConatner ({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      
      child
        : Container(
      width: double.infinity,
      child: Image.asset(
        fit: BoxFit.fill,
        height: 150.h,
        "assets/images/Mask_group.png"),
        ),
    );
  }
}
