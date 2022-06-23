import 'package:flutter/material.dart';
import 'package:ijob_app/modules/subscription/widget/address_step.dart';
import 'package:ijob_app/modules/subscription/widget/payment_step.dart';
import 'package:ijob_app/modules/subscription/widget/personal_step.dart';

List<Step> getSteps({int step = 0}) => [
      Step(
        isActive: step >= 0,
        title: const Text('Pessoal'),
        content: const PersonalStepView(),
      ),
      Step(
        isActive: step >= 1,
        title: const Text('Endereço'),
        content: const AddressStep(),
      ),
      Step(
        isActive: step >= 2,
        title: const Text('Pagamento'),
        content: const PaymentStep(),
      ),
    ];
