import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../../data/remote/service_remote_data_source.dart';

class HomeEmployeeController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final _refreshController = RefreshController().obs;
  final stController = SwipableStackController();
  // final ServiceRepository _serviceRepository = Get.find();
  final currentIndexService = 0.obs;
  final services = <Service>[].obs;
  final _likedSevices = <String>[];

  RefreshController get refreshController => _refreshController.value;

  Future<void> getServicesNear(bool loading) async {
    if (loading) showLoading();
    services.clear();
    final _servicesOrError = await _serviceRepository.getServicesNear();
    // if (_servicesOrError.isLeft()) {
    //   print('error on get services near');
    // } else {
    //   services.addAll(_servicesOrError as List<Service>);
    // }
    _servicesOrError.fold((error) {
      print('error on get services near $error');
      return;
    }, (r) {
      services.addAll(r);
    });
    resetPageState();
  }

  Future<void> likeService() async {
    showLoading();
    if (services.isNotEmpty && stController.currentIndex <= services.length - 1) {
      if (!_likedSevices.contains(services[stController.currentIndex].id!)) {
        final resultOrError = await _serviceRepository.likeService(services[currentIndexService.value].id!);
        resultOrError.fold((l) {
          print(l.toString());
          return;
        }, (r) {
          _likedSevices.add(r.service!.id!);
          print('like service ${stController.currentIndex}');
        });
      }
    }

    resetPageState();
  }

  void refreshServices() async {
    await getServicesNear(false);
    _refreshController.value.refreshCompleted();
  }

  Future<void> refuseService() async {
    print('refused service ${currentIndexService.value}');
  }

  @override
  void onInit() async {
    await getServicesNear(true);
    super.onInit();
  }
}
