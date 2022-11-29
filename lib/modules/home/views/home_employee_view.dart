import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/widget/custom_app_bar.dart';
import 'package:ijob_app/modules/home/widget/swipe/card_overlay_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../routes/app_pages.dart';
import '../controller/employee/home_employee_controller.dart';
import '../widget/drawer.dart';

class HomeEmployeeView extends BaseView<HomeEmployeeController> {
  HomeEmployeeView({Key? key}) : super(key: key);

  @override
  Widget? endDrawer() {
    return const DrawerMenu();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'IJOB',
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () => Get.toNamed(Routes.profile),
          icon: const Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.refreshServices,
        enablePullDown: true,
        enablePullUp: false,
        child: Container(
          width: Get.size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.amberAccent,
                Colors.transparent,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 450,
                width: Get.size.width * .95,
                child: Obx(() {
                  if (controller.services.length == controller.currentIndexService.value) {
                    return Center(
                      child: Text(
                        controller.services.isEmpty ? 'Não existe serviços disponíveis' : 'Não há mais serviços disponíveis próximo de você',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  return Obx(
                    () => SwipableStack(
                      overlayBuilder: (context, properties) {
                        return CardOverlayWidget(
                          swipeProgress: properties.swipeProgress,
                          direction: properties.direction,
                        );
                      },
                      onSwipeCompleted: ((index, direction) {
                        if (direction == SwipeDirection.right) {
                          controller.likeService();
                          controller.currentIndexService.value++;
                        } else if (direction == SwipeDirection.left) {
                          controller.refuseService();
                          controller.currentIndexService.value++;
                        }
                      }),
                      controller: controller.stController,
                      allowVerticalSwipe: false,
                      itemCount: controller.services.length,
                      onWillMoveNext: (index, direction) {
                        final allowedActions = [SwipeDirection.left, SwipeDirection.right];
                        return allowedActions.contains(direction);
                      },
                      builder: (context, swipeProperty) {
                        final itemIndex = swipeProperty.index % controller.services.length;
                        final service = controller.services[itemIndex];
                        return Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: NetworkImage(
                                service.servicePhotos!.isEmpty
                                    ? "https://firebasestorage.googleapis.com/v0/b/ijob-bfe21.appspot.com/o/sem-imagem.png?alt=media&token=afc9df2c-08dc-4556-9e18-fe9dd69cb6e1"
                                    : service.servicePhotos![0].url,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 450,
                          width: Get.size.width * 0.95,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 130,
                                width: 220,
                                decoration:
                                    BoxDecoration(color: Colors.white.withOpacity(0.75), borderRadius: const BorderRadius.only(topLeft: Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(service.title, style: const TextStyle(fontSize: 25)),
                                      const SizedBox(height: 10),
                                      Text(service.description, style: const TextStyle(fontSize: 15))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/voltar.png', height: 60),
                    GestureDetector(
                      onTap: () => controller.stController.next(swipeDirection: SwipeDirection.left),
                      child: Image.asset(
                        'assets/recusar.png',
                        height: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.stController.next(swipeDirection: SwipeDirection.right),
                      child: Image.asset(
                        'assets/aceitar.png',
                        height: 80,
                      ),
                    ),
                    Image.asset('assets/chat.png', height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
