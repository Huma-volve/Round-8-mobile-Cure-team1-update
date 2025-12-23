<<<<<<< HEAD
=======



>>>>>>> shaban
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SingleMonthCalendar extends StatefulWidget {
  const SingleMonthCalendar({super.key, this.onSelectedDate});
final Function(String? selectedDate)?onSelectedDate;
  @override
  State<SingleMonthCalendar> createState() => _SingleMonthCalendarState();
}

class _SingleMonthCalendarState extends State<SingleMonthCalendar> {
String ?formattedDate;
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDate;

  String? selectedDayName;
  String? selectedMonthName;
  String? selectedDayNumber;

<<<<<<< HEAD
  List<int> availableDays = [15, 16, 17, 18, 19, 20];
=======
  List<int> availableDays = [20,21,22,23,24,25,26,27,28,29];
>>>>>>> shaban

  final monthNames = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  String getWeekdayName(DateTime date) {
    const names = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return names[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    return Column(
      children: [
        // ---------------- TOP CONTAINER ----------------
        SelectedAppointementWidget(
            selectedDayName: selectedDayName,
            selectedMonthName: selectedMonthName,
            selectedDayNumber: selectedDayNumber),

        const SizedBox(height: 16),

        // ---------------- HEADER ----------------

<<<<<<< HEAD
        Container(
            height: 400.58.h,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: ColorsLight.lightGray),
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset(Assets.resourceImagesArrowLeft),
                      onPressed: () {
                        setState(() {
                          currentMonth = DateTime(
                              currentMonth.year, currentMonth.month - 1);
                          selectedDate = null;
                          selectedDayName = null;
                          selectedMonthName = null;
                          selectedDayNumber = null;
                        });
                      },
                    ),
                    Text(
                        "${monthNames[currentMonth.month]} ${currentMonth.year}",
                        style: AppTextStyles.montserratMedum16(context)
                            .copyWith(color: ColorsLight.prussianBlue)),
                    IconButton(
                      icon: Image.asset(Assets.resourceImagesArrowRight),
                      onPressed: () {
                        setState(() {
                          currentMonth = DateTime(
                              currentMonth.year, currentMonth.month + 1);
                          selectedDate = null;
                          selectedDayName = null;
                          selectedMonthName = null;
                          selectedDayNumber = null;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // ---------------- WEEKDAY ROW ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weekDays.map((d) {
                    return Expanded(
                      child: Center(
                        child: Text(d,
                            style: AppTextStyles.montserratRegular12(context)
                                .copyWith(color: ColorsLight.royalBlue)),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 8),
                // ---------------- GRID ----------------
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: daysInMonth,
                    itemBuilder: (context, index) {
                      final day = index + 1;
                      final date =
                          DateTime(currentMonth.year, currentMonth.month, day);

                      final bool isAvailable = availableDays.contains(day);

                      return GestureDetector(
                        onTap: isAvailable
                            ? () {
                                setState(() {
                                  selectedDate = date;
                                  selectedDayName = getWeekdayName(date);
                                  selectedMonthName =
                                      monthNames[currentMonth.month];
                                  selectedDayNumber = day.toString();
                                });
                              }
                            : null,
                        child: Container(
                          height: 42.h,
                          width: 42.w,
                          decoration: BoxDecoration(
                            color: selectedDate == date
                                ? Colors.blue
                                : isAvailable
                                    ? ColorsLight.grey2
                                    : ColorsLight.grey1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text("$day",
                              style: AppTextStyles.montserratRegular12(context)
                                  .copyWith(
                                      color: isAvailable
                                          ? ColorsLight.darkGrey
                                          : ColorsLight.blueGray)),
                        ),
                      );
                    },
=======
         Container(
          height: 400.58.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 3,color: ColorsLight.lightGray),
            borderRadius: BorderRadius.circular(24)
          ),
          child:Column(
            children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(Assets.resourceImagesArrowLeft),
              onPressed: () {
                setState(() {
                  currentMonth =
                      DateTime(currentMonth.year, currentMonth.month - 1);
                  selectedDate = null;
                  selectedDayName = null;
                  selectedMonthName = null;
                  selectedDayNumber = null;
                });
              },
            ),
            Text(
              "${monthNames[currentMonth.month]} ${currentMonth.year}",
              style: AppTextStyles.montserratMedum16(context).copyWith(color: ColorsLight.prussianBlue)
            ),
            IconButton(
              icon: Image.asset(Assets.resourceImagesArrowRight),
              onPressed: () {
                setState(() {
                  currentMonth =
                      DateTime(currentMonth.year, currentMonth.month + 1);
                  selectedDate = null;
                  selectedDayName = null;
                  selectedMonthName = null;
                  selectedDayNumber = null;
                });
            
              },
            ),
          ],
                 ),
         
         
         
         
         const SizedBox(height: 10),
         
                 // ---------------- WEEKDAY ROW ----------------
                 Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekDays.map((d) {
            return Expanded(
              child: Center(
                child: Text(
                  d,
                  style:AppTextStyles.montserratRegular12(context).copyWith(color: ColorsLight.royalBlue)
                ),
              ),
            );
          }).toList(),
                 ),
         
                 const SizedBox(height: 8),
           // ---------------- GRID ----------------
                 Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: daysInMonth,
            itemBuilder: (context, index) {
              final day = index + 1;
              final date =
                  DateTime(currentMonth.year, currentMonth.month, day);
         
              final bool isAvailable = availableDays.contains(day);
         
              return GestureDetector(
                onTap: isAvailable
                    ? () {
                        setState(() {
                          selectedDate = date;
                          selectedDayName = getWeekdayName(date);
                          selectedMonthName = monthNames[currentMonth.month];
                          selectedDayNumber = day.toString();
                          if(selectedDate!=null)
                          {
                            formattedDate=DateFormat('yyyy-MM-dd').format(selectedDate!);

                          }
                          else{
  formattedDate=null;
                          }
                  
                  
                        });
                        
                          widget.onSelectedDate?.call(formattedDate);

                      }
                    : null,
                child: Container(
                  height: 42.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                    color: selectedDate == date
                        ? Colors.blue
                        : isAvailable
                            ? ColorsLight.grey2
                            : ColorsLight.grey1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$day",
                    style: AppTextStyles.montserratRegular12(context).copyWith(color:isAvailable?ColorsLight.darkGrey: ColorsLight.blueGray)
>>>>>>> shaban
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class SelectedAppointementWidget extends StatelessWidget {
  const SelectedAppointementWidget({
    super.key,
    required this.selectedDayName,
    required this.selectedMonthName,
    required this.selectedDayNumber,
  });

  final String? selectedDayName;
  final String? selectedMonthName;
  final String? selectedDayNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 12.w),
      child: Row(
        children: [
          SizedBox(
              width: 20.w,
              height: 20.h,
              child: Image.asset(Assets.resourceImagesCalendar02)),
          SizedBox(
            width: 8.w,
          ),
          if (selectedDayName != null)
            Row(
              children: [
                Text('${selectedDayName!},',
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
                Text(selectedMonthName!,
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
                Text(selectedDayNumber!,
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue))
              ],
            ),
          const Spacer(),
          Image.asset(Assets.resourceImagesAltArrowDown),
        ],
      ),
    );
  }
}
