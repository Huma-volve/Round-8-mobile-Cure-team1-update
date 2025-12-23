import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../widgets/credit_card_widget.dart';
import '../../data/models/card_model.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryMonthController = TextEditingController();
  final TextEditingController _expiryYearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _cardHolder = 'Your Name';
  String _cardNumber = '0000 0000 0000 0000';
  String _expiryDate = 'MM/YY';

  @override
  void initState() {
    super.initState();
    _cardHolderController.addListener(() {
      setState(() {
        _cardHolder = _cardHolderController.text.isEmpty
            ? 'Your Name'
            : _cardHolderController.text;
      });
    });
    _cardNumberController.addListener(() {
      setState(() {
        _cardNumber = _cardNumberController.text.isEmpty
            ? '0000 0000 0000 0000'
            : _cardNumberController.text;
      });
    });
    _expiryMonthController.addListener(_updateExpiry);
    _expiryYearController.addListener(_updateExpiry);
  }

  void _updateExpiry() {
    setState(() {
      String month = _expiryMonthController.text.isEmpty
          ? 'MM'
          : _expiryMonthController.text;
      String year = _expiryYearController.text.isEmpty
          ? 'YY'
          : _expiryYearController.text;
      _expiryDate = '$month/$year';
    });
  }

  @override
  void dispose() {
    _cardHolderController.dispose();
    _cardNumberController.dispose();
    _expiryMonthController.dispose();
    _expiryYearController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _saveCard() {
    // Basic Validation
    if (_cardHolderController.text.isEmpty ||
        _cardNumberController.text.isEmpty ||
        _expiryMonthController.text.isEmpty ||
        _expiryYearController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Create Card Model
    final newCard = CardModel(
      holderName: _cardHolderController.text,
      cardNumber: _cardNumberController.text,
      expiryDate: _expiryDate,
      cvv: _cvvController.text,
      type: 'Visa', // Default logic for now, could be detected from number
    );

    Navigator.pop(context, newCard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          title: 'Add New Card',
          onPressed: () {
            GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreditCardWidget(
                cardNumber: _cardNumber,
                cardHolder: _cardHolder,
                expiryDate: _expiryDate,
              ),
              SizedBox(height: 32.h),
              Text('Cardholder Name',
                  style: StyleTextHelper.textStyle16Regular(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'Cardholder Name',
                controller: _cardHolderController,
              ),
              SizedBox(height: 24.h),
              Text('Card Number',
                  style: StyleTextHelper.textStyle16Regular(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'Card Number',
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                suffixIcon: Icon(
                  Icons.credit_card,
                  color: ColorsLight.textGrey,
                  size: 10.sp,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expiry Date',
                            style: StyleTextHelper.textStyle16Regular(context)),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: 60.w,
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildSmallInput(
                                  'MM',
                                  _expiryMonthController,
                                ),
                              ),
                              Container(
                                color: ColorsLight.gray,
                                width: 1.w,
                                height: 40.h,
                              ),
                              Expanded(
                                child: _buildSmallInput(
                                  'YY',
                                  _expiryYearController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CVV Code',
                            style: StyleTextHelper.textStyle16Regular(context)),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hintText: '123',
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150.h),
              CustomButton(text: 'Save', onPressed: _saveCard),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallInput(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsLight.inputFill,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: StyleTextHelper.textStyle16Regular(context),
        keyboardType: TextInputType.number,
        maxLength: 2,
        decoration: InputDecoration(
          counterText: "", // Hide character counter
          hintText: hint,
          hintStyle: StyleTextHelper.textStyle16Regular(context),
          border: InputBorder.none,
          // contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }
}
