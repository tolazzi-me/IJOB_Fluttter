import 'package:ijob_app/core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/model/service_model.dart';
import '../../../data/remote/service_remote_data_source.dart';

class LikedServicesController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final _refreshController = RefreshController().obs;
  final services = <Service>[].obs;

  RefreshController get refreshController => _refreshController.value;

  @override
  void onInit() async {
    await getLikedServices(true);
    super.onInit();
  }

  Future<void> getLikedServices(bool loading) async {
    if (loading) showLoading();
    services.clear();
    final servicesOrError = await _serviceRepository.getLikedServices();
    servicesOrError.fold((error) {
      resetPageState();
      showRedSnackBar('Erro', 'Falha ao carregar os serviços aceitos');
    }, (r) {
      services.addAll(r);
    });
    resetPageState();
  }

  void refreshServices() async {
    await getLikedServices(false);
    _refreshController.value.refreshCompleted();
  }
}
