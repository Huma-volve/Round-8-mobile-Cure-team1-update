import 'package:cure_team_1_update/core/utils/assets.dart';

class PaymentMethodModel {
  final String title;
  final String image;
  final String gateway;

  PaymentMethodModel(
      {required this.title, required this.image, required this.gateway});
}

List<PaymentMethodModel> paymentItemsList = [
  PaymentMethodModel(
      title: 'Credit Card',
      image: Assets.resourceImagesVisa,
      gateway: 'stripe'),
  PaymentMethodModel(
      title: 'PayPal',
      image: Assets.resourceImagesPaypal,
      gateway: 'paypal'),
  PaymentMethodModel(
      title: 'Apple Pay',
      image: Assets.resourceImagesApplePay,
      gateway: 'apple_pay'),
];
