import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/routes/app_pages.dart';

class NetworkController extends BaseController {
  final connectionType = 0.obs;
  final _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;
  @override
  void onInit() async {
    await _getConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  Future<void> _getConnectionType() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult!);
  }

  _updateState(ConnectivityResult result) {
    print(result);
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        // Get.toNamed(Routes.main);
        Get.back();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        // Get.toNamed(Routes.main);
        Get.back();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        Get.toNamed(Routes.notConnection);
        break;
      default:
        Get.snackbar('Erro de conexão', 'Falha ao obter informações da conexão');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
