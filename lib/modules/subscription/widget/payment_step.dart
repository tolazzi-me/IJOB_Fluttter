import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/subscription/widget/custom_text_field.dart';

import '../controllers/subscription_controller.dart';

class PaymentStep extends StatelessWidget {
  const PaymentStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubscriptionController>();
    return Column(
      children: [
        const Text('Dados do cartão de crédito'),
        CustomTextField(text: 'Número do cartão', ec: controller.cardNumberEC, keyboardType: TextInputType.number),
        CustomTextField(text: 'Validade', ec: controller.expirationEC, keyboardType: TextInputType.phone),
        CustomTextField(text: 'CVV', ec: controller.cvvEC, keyboardType: TextInputType.number),
      ],
    );
  }
}
