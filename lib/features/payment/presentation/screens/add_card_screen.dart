import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:u_credit_card/u_credit_card.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../data/models/card_model.dart';

class AddCardScreen extends StatefulWidget {
  final CardModel? card;
  const AddCardScreen({super.key, this.card});

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
  String _expiryDate = 'MM/YY';
  String? _selectedBrand;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.card != null) {
      _selectedBrand = widget.card!.brand;
      _expiryMonthController.text =
          widget.card!.expMonth.toString().padLeft(2, '0');
      _expiryYearController.text =
          (widget.card!.expYear % 100).toString().padLeft(2, '0');
      _expiryDate = _buildExpiryLabel();
    }
    _cardHolderController.addListener(() {
      setState(() {
        _cardHolder = _cardHolderController.text.isEmpty
            ? 'Your Name'
            : _cardHolderController.text;
      });
    });
    _cardNumberController.addListener(() {
      setState(() {
        // Rebuild to update the card preview.
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

  Future<void> _saveCard() async {
    if (_isSubmitting) {
      return;
    }
    if (_selectedBrand == null) {
      AppToast.show(context, 'Please select card type');
      return;
    }
    if (!(_formKey.currentState?.validate() ?? false)) {
      AppToast.show(context, 'Please fix the highlighted fields');
      return;
    }
    final expMonthRaw = int.tryParse(_expiryMonthController.text);
    final expYearRaw = int.tryParse(_expiryYearController.text);
    if (expMonthRaw == null || expMonthRaw < 1 || expMonthRaw > 12) {
      AppToast.show(context, 'Please enter a valid expiry month');
      return;
    }
    if (expYearRaw == null) {
      AppToast.show(context, 'Please enter a valid expiry year');
      return;
    }
    final expYear = expYearRaw < 100 ? 2000 + expYearRaw : expYearRaw;
    final now = DateTime.now();
    if (expYear < now.year ||
        (expYear == now.year && expMonthRaw < now.month)) {
      AppToast.show(context, 'Card expiry date is in the past');
      return;
    }
    final cardNumber = _cardNumberController.text
        .replaceAll(RegExp(r'\s+'), '')
        .trim();
    final isEditing = widget.card != null;
    if (!isEditing && cardNumber.isEmpty) {
      AppToast.show(context, 'Please enter card number');
      return;
    }
    if (!isEditing && _cvvController.text.isEmpty) {
      AppToast.show(context, 'Please enter CVV code');
      return;
    }
    if (cardNumber.isNotEmpty) {
      if (!RegExp(r'^\d+$').hasMatch(cardNumber)) {
        AppToast.show(context, 'Card number should contain digits only');
        return;
      }
      if (cardNumber.length < 12 || cardNumber.length > 19) {
        AppToast.show(context, 'Card number length is invalid');
        return;
      }
    }
    if (!isEditing && _cvvController.text.isNotEmpty) {
      if (!RegExp(r'^\d{3,4}$').hasMatch(_cvvController.text)) {
        AppToast.show(context, 'CVV must be 3 or 4 digits');
        return;
      }
    }
    final lastFour = cardNumber.isNotEmpty
        ? cardNumber.substring(cardNumber.length - 4)
        : widget.card?.lastFour ?? '';
    if (lastFour.isEmpty) {
      AppToast.show(context, 'Please enter card number');
      return;
    }
    final payload = {
      'provider_token': _buildProviderToken(_selectedBrand!, lastFour),
      'brand': _selectedBrand,
      'last_four': lastFour,
      'exp_month': expMonthRaw,
      'exp_year': expYear,
      'is_default': widget.card?.isDefault ?? false,
    };

    setState(() {
      _isSubmitting = true;
    });

    try {
      final api = getIt<ApiServices>();
      final response = isEditing
          ? await api.put('saved-cards/${widget.card!.id}', payload)
          : await api.post('saved-cards', payload);
      final savedCard = CardModel.fromResponse(response);
      if (!mounted) {
        return;
      }
      AppToast.show(
        context,
        isEditing ? 'Card updated successfully.' : 'Card added successfully.',
      );
      Navigator.pop(context, savedCard);
    } on DioException catch (error) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, _extractErrorMessage(error));
    } catch (_) {
      if (!mounted) {
        return;
      }
      AppToast.show(context, 'Failed to save card. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.sizeOf(context).width - 48;
    final cardWidth = availableWidth > 300 ? 300.0 : availableWidth;
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          title: widget.card == null ? 'Add New Card' : 'Edit Card',
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
              Center(
                child: CreditCardUi(
                  width: cardWidth,
                  cardHolderFullName:
                      _cardHolder.isEmpty ? 'YOUR NAME' : _cardHolder,
                  cardNumber: _previewCardNumber(),
                  validThru: _expiryDate,
                  cardType: CardType.credit,
                  creditCardType: _creditCardType(),
                  shouldMaskCardNumber: false,
                  enableFlipping: true,
                  cvvNumber: _cvvController.text,
                  topLeftColor: ColorsLight.primaryColor,
                  bottomRightColor: ColorsLight.primaryColor,
                ),
              ),
              SizedBox(height: 32.h),
              Text('Card Type',
                  style: StyleTextHelper.textStyle16Regular(context)),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: [
                  _buildBrandOption(
                    label: 'Visa',
                    assetPath: Assets.paymentVisa,
                  ),
                  _buildBrandOption(
                    label: 'MasterCard',
                    assetPath: Assets.paymentIcOutlinePaypal,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text('Cardholder Name',
                  style: StyleTextHelper.textStyle16Regular(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'Cardholder Name',
                controller: _cardHolderController,
                validator: _validateCardHolder,
              ),
              SizedBox(height: 24.h),
              Text('Card Number',
                  style: StyleTextHelper.textStyle16Regular(context)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: widget.card == null
                    ? 'Card Number'
                    : '**** ${widget.card!.lastFour}',
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                suffixIcon: Icon(
                  Icons.credit_card,
                  color: ColorsLight.textGrey,
                  size: 10.sp,
                ),
                validator: (value) => _validateCardNumber(value, widget.card),
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
              CustomButton(
                text: _isSubmitting ? 'Saving...' : 'Save',
                onPressed: _saveCard,
              ),
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

  String _buildExpiryLabel() {
    final month = _expiryMonthController.text.isEmpty
        ? 'MM'
        : _expiryMonthController.text;
    final year =
        _expiryYearController.text.isEmpty ? 'YY' : _expiryYearController.text;
    return '$month/$year';
  }

  Widget _buildBrandOption({
    required String label,
    required String assetPath,
  }) {
    final isSelected = _selectedBrand == label;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedBrand = label;
        });
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorsLight.inputFill,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color:
                isSelected ? ColorsLight.primaryColor : ColorsLight.inputFill,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(assetPath, width: 18.w, height: 18.w),
            SizedBox(width: 6.w),
            Text(
              label,
              style: StyleTextHelper.textStyle14Regular(context).copyWith(
                color: isSelected
                    ? ColorsLight.primaryColor
                    : ColorsLight.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _previewCardNumber() {
    final raw = _cardNumberController.text.replaceAll(RegExp(r'\s+'), '');
    if (raw.isNotEmpty) {
      return raw;
    }
    if (widget.card != null && widget.card!.lastFour.isNotEmpty) {
      return '000000000000${widget.card!.lastFour}'.padLeft(16, '0');
    }
    return '0000000000000000';
  }

  CreditCardType _creditCardType() {
    final normalized = _selectedBrand?.toLowerCase() ?? '';
    if (normalized.contains('visa')) {
      return CreditCardType.visa;
    }
    if (normalized.contains('master')) {
      return CreditCardType.mastercard;
    }
    return CreditCardType.none;
  }

  String? _validateCardHolder(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return 'Cardholder name is required';
    }
    if (text.length < 3) {
      return 'Please enter full name';
    }
    return null;
  }

  String? _validateCardNumber(String? value, CardModel? card) {
    final raw = (value ?? '').replaceAll(RegExp(r'\s+'), '').trim();
    if (raw.isEmpty) {
      return card == null ? 'Card number is required' : null;
    }
    if (!RegExp(r'^\d+$').hasMatch(raw)) {
      return 'Card number should contain digits only';
    }
    if (raw.length < 12 || raw.length > 19) {
      return 'Card number length is invalid';
    }
    return null;
  }
}

String _buildProviderToken(String brand, String lastFour) {
  final normalized = brand.toLowerCase();
  if (normalized.contains('visa')) {
    return 'pm_card_visa';
  }
  if (normalized.contains('master')) {
    return 'pm_card_mastercard';
  }
  return 'pm_card_visa';
}

String _extractErrorMessage(DioException error) {
  final data = error.response?.data;
  if (data is Map<String, dynamic> && data['message'] is String) {
    return data['message'] as String;
  }
  if (error.response?.statusCode == 401) {
    return 'Please log in to manage cards.';
  }
  return 'Failed to reach server. Try again.';
}
