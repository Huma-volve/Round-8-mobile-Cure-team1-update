
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelReasonWidget extends StatelessWidget {
  const CancelReasonWidget({
    super.key,
    this.onSaved, required this.formkey,
  });
 
  final Function(String?)? onSaved;
   final GlobalKey<FormState> formkey ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 106.r,
        ),
        Form(
          key: formkey,
          child: TextFormField(
            validator: (value) {
              if(value!.isEmpty || value=='')
              {
                return 'This fild is required';
              }
              return null;
            },
            onSaved: onSaved,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                hintText: 'What is the reason for cancellation ?',
                hintStyle: AppTextStyles.montserratMedum14(context)
                    .copyWith(color: ColorsLight.blueGray),
                focusedBorder: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder()),
          ),
        ),
        SizedBox(
          height: 130.r,
        ),
      ],
    );
  }
}

