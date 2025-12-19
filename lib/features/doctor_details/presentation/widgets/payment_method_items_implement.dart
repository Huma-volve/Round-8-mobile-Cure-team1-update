import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodItemsImplement extends StatefulWidget {
  const PaymentMethodItemsImplement({super.key});

  @override
  State<PaymentMethodItemsImplement> createState() =>
      _PaymentMethodItemsImplementState();
}

class _PaymentMethodItemsImplementState
    extends State<PaymentMethodItemsImplement> {
  int selecteditem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentItemsList.asMap().entries.map((e) {
        e.value;

        return GestureDetector(
            onTap: () {
              setState(() {
                selecteditem = e.key;
              });
            },
            child: PaymentItem(
              paymendata: e.value,
              isActiveItem: selecteditem == e.key,
            ));
      }).toList(),
    );
  }
}
