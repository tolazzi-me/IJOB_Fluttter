import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/subscription_controller.dart';
import 'custom_text_field.dart';

class AddressStep extends StatelessWidget {
  const AddressStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SubscriptionController>();
    return Column(
      children: [
        const Text('Endereço do titular e de cobrança'),
        CustomTextField(text: 'Rua/Avenida', ec: controller.streetEC),
        CustomTextField(text: 'Número', ec: controller.numberAddressEC),
        CustomTextField(text: 'Bairro', ec: controller.neighborhoodEC),
        CustomTextField(text: 'CEP', ec: controller.zipCodeEC, keyboardType: TextInputType.number),
        CustomTextField(text: 'Cidade', ec: controller.cityEC),
        CustomTextField(text: 'UF', ec: controller.stateEC),
        CustomTextField(text: 'Complemento', ec: controller.complementEC),
        Obx(
          () => CheckboxListTile(
              title: const Text('Meu endereço de cobrança é o mesmo'),
              value: controller.isSameAddress,
              onChanged: (bool? value) => controller.isSameAddress = value),
        ),
        const SizedBox(height: 12),
        Obx(
          () => Visibility(
            visible: !controller.isSameAddress,
            child: Column(
              children: [
                const Text('Endereço de cobrança'),
                CustomTextField(text: 'Rua/Avenida', ec: controller.street1EC),
                CustomTextField(text: 'Número', ec: controller.numberAddress1EC, keyboardType: TextInputType.number),
                CustomTextField(text: 'Bairro', ec: controller.neighborhood1EC),
                controller.isSameAddress
                    ? Container()
                    : CustomTextField(text: 'CEP', ec: controller.zipCode1EC, keyboardType: TextInputType.number),
                CustomTextField(text: 'Cidade', ec: controller.city1EC),
                CustomTextField(text: 'UF', ec: controller.state1EC),
                CustomTextField(text: 'Complemento', ec: controller.complement1EC),
              ],
            ),
          ),
        )
      ],
    );
  }
}
