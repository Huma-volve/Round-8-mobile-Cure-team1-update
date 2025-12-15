
import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourGrideView extends StatelessWidget {
  const HourGrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 105.r/ 40.r,
            crossAxisCount: 3,
            mainAxisSpacing: 16.r,
            crossAxisSpacing: 40.r),
        itemBuilder: (context, index) =>  HourGrideViewItem(time: allTimes[index], selectedTime: '11:00 AM',));
  }
}
List<String>allTimes=[
  '9:00 AM','10:00 AM','11:00 AM','12:30 AM','4:00 PM','5:30 PM','7:00 PM','9:00 PM','10:00 PM'
];