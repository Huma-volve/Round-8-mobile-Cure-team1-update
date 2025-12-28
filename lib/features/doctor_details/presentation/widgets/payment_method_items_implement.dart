import 'package:cure_team_1_update/features/doctor_details/data/models/payment_method_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodItemsImplement extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<PaymentMethodModel>? onSelected;
  const PaymentMethodItemsImplement({
    super.key,
    this.initialIndex = 0,
    this.onSelected,
  });

  @override
  State<PaymentMethodItemsImplement> createState() =>
      _PaymentMethodItemsImplementState();
}

class _PaymentMethodItemsImplementState
    extends State<PaymentMethodItemsImplement> {
  late int selecteditem;

  @override
  void initState() {
    super.initState();
    selecteditem = widget.initialIndex;
  }
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
              widget.onSelected?.call(e.value);
            },
            child: PaymentItem(
              paymendata: e.value,
              isActiveItem: selecteditem == e.key,
            ));
      }).toList(),
    );
  }
}
