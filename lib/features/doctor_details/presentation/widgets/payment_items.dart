import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/payment_method_items_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodItems extends StatelessWidget {
  final int initialIndex;
  final ValueChanged<PaymentMethodModel>? onSelected;
  const PaymentMethodItems({
    super.key,
    this.initialIndex = 0,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: AppTextStyles.georgiaRegular20(context)
              .copyWith(color: ColorsLight.prussianBlue),
        ),
        SizedBox(
          height: 16.h,
        ),
        PaymentMethodItemsImplement(
          initialIndex: initialIndex,
          onSelected: onSelected,
        )
      ],
    );
  }
}
