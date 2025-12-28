import 'dart:developer';

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class YourApointMentDateWidget extends StatefulWidget {
  const YourApointMentDateWidget({
    super.key,
    this.initialDate,
    this.onDateSelected,
    this.availableDates = const {},
  });

  final String? initialDate;
  final ValueChanged<String>? onDateSelected;
  final Set<String> availableDates;

  @override
  State<YourApointMentDateWidget> createState() =>
      _YourApointMentDateWidgetState();
}

class _YourApointMentDateWidgetState extends State<YourApointMentDateWidget> {
  bool activeCalender = false;
  String? formatedDate;
  String? apiDate;

  @override
  void initState() {
    super.initState();
    _setInitialDate(widget.initialDate);
  }

  @override
  void didUpdateWidget(covariant YourApointMentDateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialDate != widget.initialDate) {
      _setInitialDate(widget.initialDate);
    }
  }

  void _setInitialDate(String? date) {
    if (date == null || date.trim().isEmpty) {
      return;
    }
    final parsed = DateTime.tryParse(date);
    if (parsed != null) {
      formatedDate = DateFormat('EEEE,MMMM d').format(parsed);
      apiDate = DateFormat('yyyy-MM-dd').format(parsed);
    } else {
      formatedDate = date;
      apiDate = date;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.r,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.r, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 12.w),
      child: Row(
        children: [
          SizedBox(
              width: 20.r,
              height: 20.r,
              child: Image.asset(Assets.resourceImagesCalendar02)),
          SizedBox(
            width: 8.r,
          ),
         Text(formatedDate ??'',
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              setState(() {
                activeCalender = !activeCalender;
              });
              if (activeCalender) {
                DateTime? selectedDateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2027),
                  selectableDayPredicate: widget.availableDates.isEmpty
                      ? null
                      : (date) {
                          final key = DateFormat('yyyy-MM-dd').format(date);
                          return widget.availableDates.contains(key);
                        },
                );
                if(selectedDateTime!=null)
                {
                formatedDate=DateFormat('EEEE,MMMM d').format(selectedDateTime);
                apiDate = DateFormat('yyyy-MM-dd').format(selectedDateTime);
                  log(formatedDate!);
                if (apiDate != null) {
                  widget.onDateSelected?.call(apiDate!);
                }
                }
              }
            },
            child: SizedBox(
                height: 24.r,
                width: 24.r,
                child: Image.asset(activeCalender == true
                    ? Assets.resourceImagesDownArrow
                    : Assets.resourceImagesAltArrowDown)),
          ),
        ],
      ),
    );
  }
}
