import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/theme/app_theme.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'cards_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int? _selectedWallet; // Null means no wallet selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'Payment Method',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Credit & Debit Card', style: AppTextStyles.styleLarge10),
            SizedBox(height: 16.h),
            _buildCardDisplay(
              'VISA',
              'Bank Name',
              true,
            ), // Default to Visa for now
            SizedBox(height: 16.h),
            _buildCardDisplay('MasterCard', 'Bank Name', false),

            SizedBox(height: 32.h),
            Text('More Payment Options', style: AppTextStyles.styleLarge10),
            SizedBox(height: 16.h),

            // Wallet Options
            Container(
              decoration: BoxDecoration(
                color: ColorsLight.inputFill,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  _buildWalletItem(0, 'Apple Pay', Assets.paymentLogosApplePay),
                  Divider(height: 1.h, color: Colors.grey.shade200),
                  _buildWalletItem(1, 'Paypal', Assets.paymentIcOutlinePaypal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDisplay(String type, String title, bool isVisa) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoute.cardsScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsLight.inputFill,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorsLight.inputFill),
        ),
        child: ListTile(
          leading: SizedBox(
            width: 18.w,
            child: SvgPicture.asset(
              isVisa
                  ? Assets
                      .paymentVisa // Assuming visa handles 'Debit Card' case visually roughly
                  : Assets
                      .paymentIcOutlinePaypal, // Fallback since mastercard asset is missing
              width: 18.w,
              height: 18.h, // Adjusted size
            ),
          ),
          // Wait, for 'Debit Card' vs 'Credit Card', the prompt implies these are linked cards.
          // The icons in screenshot are generic card icons or brand icons.
          // I will use Visa for one and maybe another asset if available, but for now Visa is fine or just leave as is.
          // Actually, the previous step used Assets.visa, so I stick with it.
          // For the second one, I will leave it as AppAssets.visa or check if I have mastercard. I don't.
          // I'll keep the logic simple.
          title: Text(type, style: AppTextStyles.styleMedium8),
          trailing: Icon(
            Icons.chevron_right,
            color: ColorsLight.textGrey,
            size: 10.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildWalletItem(int index, String name, String assetPath) {
    final isSelected = _selectedWallet == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedWallet = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ListTile(
          leading: SizedBox(
              width: 18.w,
              child: SvgPicture.asset(assetPath, width: 12.w, height: 12.w)),
          title: Text(name, style: AppTextStyles.styleMedium8),
          trailing: Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? ColorsLight.primaryColor : Colors.grey,
                width: 0.6.w,
              ),
            ),
            // padding: EdgeInsets.all(2.r),
            child: isSelected
                ? CircleAvatar(backgroundColor: ColorsLight.primaryColor)
                : null,
          ),
        ),
      ),
    );
  }
}
