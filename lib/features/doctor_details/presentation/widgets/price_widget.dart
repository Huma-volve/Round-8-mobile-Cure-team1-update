import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double? price;
  const PriceWidget({
    super.key,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: 'Price', style: AppTextStyles.montserratMedum24(context)),
            TextSpan(
                text: ' / ', style: AppTextStyles.montserratMedum12(context)),
            TextSpan(
                text: ' hour', style: AppTextStyles.montserratMedum12(context)),
          ]),
        ),
        const Spacer(),
        Text(
          price != null ? '${price!.toStringAsFixed(0)}\$' : '--',
          style: AppTextStyles.montserratMedum16(context)
              .copyWith(color: ColorsLight.red),
        )
      ],
    );
  }
}
