import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/service_model.dart';

import '../../../../data/remote/service_remote_data_source.dart';

class HomeEmployerController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final services = <Service>[].obs;

  Future<void> getServices() async {
    final servicesOrError = await _serviceRepository.getServices();
    servicesOrError.fold((error) {
      print(error);
    }, (result) {
      services.addAll(result);
    });
  }

  @override
  void onInit() async {
    await getServices();
    super.onInit();
  }
}
