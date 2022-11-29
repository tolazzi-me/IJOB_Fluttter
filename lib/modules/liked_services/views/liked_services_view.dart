import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/modules/liked_services/controller/liked_service_controller.dart';
import 'package:ijob_app/modules/liked_services/widgets/details_service_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/widget/elevated_container.dart';

class LikedServicesView extends BaseView<LikedServicesController> {
  LikedServicesView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Trabalhos aceitos',
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: false,
        controller: controller.refreshController,
        onRefresh: controller.refreshServices,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 40, right: 12.0, left: 12.0, bottom: 0),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.services.length,
                itemBuilder: ((context, index) {
                  final service = controller.services[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailsServiceWidget(service: service));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedContainer(
                        child: ListTile(
                          title: Text(
                            service.title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(service.description),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
