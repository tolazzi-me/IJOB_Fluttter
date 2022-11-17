import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/base/network_controller.dart';
import 'package:lottie/lottie.dart';

class NoNetworkConnectionWidget extends BaseView<NetworkController> {
  NoNetworkConnectionWidget({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.connectionType.value == 0) {
          return false;
        } else {
          return true;
        }
      },
      child: SizedBox(
        width: Get.size.width,
        height: Get.size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/no-mobile-internet.json'),
            const SizedBox(
              height: 10,
            ),
            const Text('Você está sem conexão com a internet'),
          ],
        ),
      ),
    );
  }
}
