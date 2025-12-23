import 'package:cure_team_1_update/core/utils/assets.dart';

class PaymentMethodModel {
  final String title;
  final String image;

  PaymentMethodModel({required this.title, required this.image});
}

List<PaymentMethodModel> paymentItemsList = [
  PaymentMethodModel(title: 'Credit Cart', image: Assets.resourceImagesVisa),
  PaymentMethodModel(title: 'PayPal', image: Assets.resourceImagesPaypal),
  PaymentMethodModel(title: 'Apple Pay', image: Assets.resourceImagesApplePay),
];
