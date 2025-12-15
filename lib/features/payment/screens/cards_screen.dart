import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/theme/app_theme.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/payment/widgets/build_empity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/custom_widgets.dart';
import '../models/card_model.dart';
import 'add_card_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  // List to hold CardModel objects

  //for test
  final List<CardModel> _cards = [
    CardModel(
      type: 'MasterCard',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
    CardModel(
      type: 'Visa',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
    CardModel(
      type: 'MasterCard',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
    CardModel(
      type: 'Visa',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
    CardModel(
      type: 'MasterCard',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
    CardModel(
      type: 'Visa',
      cardNumber: '1234 5678 9012 3456',
      holderName: 'John Doe',
      expiryDate: '12/24',
      cvv: '123',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'My Cards',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: _cards.isEmpty ? buildEmptyState() : buildCardList(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: CustomButton(
          text: '+  Add Card',
          onPressed: () async {
            final newCard = await Navigator.push<CardModel>(
              context,
              MaterialPageRoute(builder: (_) => const AddCardScreen()),
            );

            if (newCard != null) {
              setState(() {
                _cards.add(newCard);
              });
            }
          },
        ),
      ),
    );
  }

  Widget buildCardList() {
    return ListView.builder(
      padding: EdgeInsets.all(18.0.r),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        final card = _cards[index];
        // formatting number to show only last 4 or similar
        // For simplicity: "Visa **** 1234"
        final last4 = card.cardNumber.isNotEmpty && card.cardNumber.length >= 4
            ? card.cardNumber.substring(card.cardNumber.length - 4)
            : '****';

        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: ColorsLight.inputFill,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              // Icon
              SvgPicture.asset(
                Assets.paymentVisa, // Using generic Visa logo for now
                width: 18.w,
                height: 18.w,
              ),
              SizedBox(width: 8.w),
              // Text
              Expanded(
                child: Text(
                  '${card.type} **** $last4',
                  style: AppTextStyles.styleMedium10,
                ),
              ),
              // Radio
              Icon(
                Icons.radio_button_checked,
                color: ColorsLight.primaryColor,
                size: 24.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
