import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/subscription/controllers/subscription_controller.dart';

import 'custom_text_field.dart';

class PersonalStepView extends StatelessWidget {
  const PersonalStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubscriptionController>();
    return Column(
      children: [
        const Text('Informações pessoais do titular do pagamento'),
        CustomTextField(text: 'Nome', ec: controller.nameEC),
        CustomTextField(text: 'CPF', ec: controller.cpfEC, keyboardType: TextInputType.number),
        CustomTextField(text: 'E-mail', ec: controller.emailEC, keyboardType: TextInputType.emailAddress),
        CustomTextField(text: 'Data de nascimento', ec: controller.birthEC, keyboardType: TextInputType.datetime),
        CustomTextField(text: 'Telefone Celular', ec: controller.phoneNumberEC, keyboardType: TextInputType.phone),
      ],
    );
  }
}
