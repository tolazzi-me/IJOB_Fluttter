import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/modules/subscription/controllers/subscription_controller.dart';
import 'package:ijob_app/modules/subscription/widget/steps.dart';

class SubscriptionView extends BaseView<SubscriptionController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => Stepper(
        currentStep: controller.currentStep,
        type: StepperType.horizontal,
        steps: getSteps(step: controller.currentStep),
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(details.currentStep == getSteps().length - 1 ? 'Assinar' : 'Próximo')),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                      onPressed: details.onStepCancel, child: Text(details.currentStep == 0 ? 'Cancelar' : 'Voltar')),
                ),
              ],
            ),
          );
        },
        onStepContinue: () {
          bool isLastStep = controller.currentStep == getSteps().length - 1 ? true : false;
          if (isLastStep) {
            if (controller.isValidSubscriptionData) {
              final plan = Get.arguments as Plan;
              controller.paySubscription(plan);
            }
          } else {
            controller.incrementStep();
          }
        },
        onStepCancel: () => controller.currentStep == 0 ? Get.back() : controller.decrementStep(),
      ),
    );
  }
}
