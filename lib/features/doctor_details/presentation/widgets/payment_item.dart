
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/actice_circle_checked_icon.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/un_active_circle_checked_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key, required this.paymendata, required this.isActiveItem,
  });
final PaymentMethodModel paymendata;
final bool isActiveItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
      color:isActiveItem?ColorsLight.lightGreen:Colors.transparent,
        borderRadius: BorderRadius.circular(8)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            isActiveItem? const ActiveCirlcleCheckedIcon() :const UnActiveCirlcleCheckedIcon(),
           
          SizedBox(width: 8.w,),
            Text(paymendata.title,style: AppTextStyles.montserratRegular16(context).copyWith(color:isActiveItem? ColorsLight.green:ColorsLight.blueGray,),),
          const  Spacer(),
            Image.asset(paymendata.image)
          ],
        ),
      ),
    );
  }
}

