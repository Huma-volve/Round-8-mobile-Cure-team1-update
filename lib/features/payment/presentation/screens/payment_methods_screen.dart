import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/payment/presentation/screens/cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            Text('Credit & Debit Card',
                style: StyleTextHelper.textStyle20Regular(context).copyWith(
                  fontFamily: 'georgia',
                )),
            SizedBox(height: 16.h),
            _buildCardDisplay(
              'VISA',
              'Bank Name',
              true,
            ), // Default to Visa for now
            SizedBox(height: 16.h),
            _buildCardDisplay('MasterCard', 'Bank Name', false),
            SizedBox(height: 32.h),
            Text('More Payment Options',
                style: StyleTextHelper.textStyle20Regular(context).copyWith(
                  fontFamily: 'georgia',
                )),
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
                  Divider(height: 1.h, color: Colors.grey.shade200),
                  _buildWalletItem(
                      1, 'mobile wallets ', Assets.profileGroupAddCard),
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
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CardsScreen();
          },
        ));
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
          title: Text(type, style: StyleTextHelper.textStyle16Regular(context)),
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
          title: Text(name, style: StyleTextHelper.textStyle16Regular(context)),
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
