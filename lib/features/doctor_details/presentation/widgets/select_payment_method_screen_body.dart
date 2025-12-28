import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/select_payment_method_screen_scrollable_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectPaymentMethodScreenBody extends StatefulWidget {
  final BookingFlowData? data;
  const SelectPaymentMethodScreenBody({super.key, this.data});

  @override
  State<SelectPaymentMethodScreenBody> createState() =>
      _SelectPaymentMethodScreenBodyState();
}

class _SelectPaymentMethodScreenBodyState
    extends State<SelectPaymentMethodScreenBody> {
  bool _isProcessing = false;
  PaymentMethodModel? _selectedMethod;

  @override
  void initState() {
    super.initState();
    if (paymentItemsList.isNotEmpty) {
      _selectedMethod = paymentItemsList.first;
    }
  }

  Future<void> _processPayment() async {
    final data = widget.data;
    if (data == null) {
      _showMessage('Booking data is missing.');
      return;
    }
    if (data.bookingId == 0) {
      _showMessage('Booking is not created yet.');
      return;
    }
    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      _showMessage('Please log in to pay.');
      return;
    }
    final method = _selectedMethod;
    if (method == null) {
      _showMessage('Please select a payment method.');
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      final api = getIt<ApiServices>();
      await api.post('payments/process', {
        'booking_id': data.bookingId,
        'gateway': method.gateway,
      });
      if (!mounted) return;
      _showMessage('Payment completed successfully.');
      context.go(AppRoute.navBar, extra: 1);
    } catch (error) {
      if (!mounted) return;
      _showMessage(_extractErrorMessage(error));
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  String _extractErrorMessage(Object error) {
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        final message = data['message'];
        if (message is String && message.isNotEmpty) {
          return message;
        }
        final errors = data['errors'];
        if (errors is Map<String, dynamic> && errors.isNotEmpty) {
          final first = errors.values.first;
          if (first is List && first.isNotEmpty) {
            return first.first.toString();
          }
          return first.toString();
        }
      }
      if (data is String && data.isNotEmpty) {
        return data;
      }
      if (error.response?.statusCode == 401) {
        return 'Please log in to pay.';
      }
      return error.message ?? 'Payment failed. Please try again.';
    }
    if (error is Exception) {
      return error.toString();
    }
    return 'Payment failed. Please try again.';
  }

  void _showMessage(String message) {
    AppToast.show(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SelectPaymentMethodScreenScrollableContent(
          data: widget.data,
          selectedGateway: _selectedMethod?.gateway,
          onMethodSelected: (method) {
            setState(() {
              _selectedMethod = method;
            });
          },
        ),
        PriceAndBookActionFooterButton(
          buttonName: 'Pay',
          price: widget.data?.doctor.sessionPrice,
          loadingState: _isProcessing,
          onPressed: _isProcessing ? null : _processPayment,
        )
      ],
    );
  }
}
