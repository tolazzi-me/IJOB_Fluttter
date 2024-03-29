import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/values/app_colors.dart';
import 'package:ijob_app/core/values/app_values.dart';
import 'package:ijob_app/core/widget/custom_app_bar.dart';
import 'package:ijob_app/modules/premium/controllers/premium_controller.dart';
import 'package:ijob_app/modules/premium/widgets/carousel.dart';
import 'package:ijob_app/modules/premium/widgets/plan.dart';

import '../../../routes/app_pages.dart';

class PremiumView extends BaseView<PremiumnController> {
  final headerImages = ['assets/BannerLogin1.png', 'assets/BannerLogin2.png'];

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: '',
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 24),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppValues.margin_20),
              height: 300,
              width: double.maxFinite,
              child: PageView.builder(
                  itemCount: headerImages.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Image.asset(
                      headerImages[pagePosition],
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValues.radius_25),
                  topRight: Radius.circular(AppValues.radius_25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 25, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Escolha seu plano',
                      style: TextStyle(fontFamily: 'Chopsic', fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Economize na sua primeira compra!',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.plans.length,
                        itemBuilder: (context, index) {
                          final _plan = controller.plans[index];
                          return Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: PlanBoxWdiget(
                                plan: _plan,
                                color: _plan.id == controller.selectedPlan?.id ? AppColors.textColorYellow : AppColors.colorWhite,
                                onPressed: () {
                                  controller.selectPlan(_plan);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 45,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.selectedPlan != null) {
                            // GO TO Subscription Page
                            Get.toNamed(
                              Routes.subscription,
                              arguments: controller.selectedPlan,
                            );
                          }
                        },
                        child: const Text('Assine agora', style: TextStyle(color: AppColors.blackColor, fontSize: 20)),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppValues.radius_12),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.textColorYellow),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
