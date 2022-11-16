import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../../data/remote/service_remote_data_source.dart';

class HomeEmployeeController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final stController = SwipableStackController();
  // final ServiceRepository _serviceRepository = Get.find();
  final currentIndexService = 0.obs;
  final services = <Service>[].obs;
  final _likedSevices = <String>[];

  Future<void> getServicesNear() async {
    showLoading();
    services.clear();
    final _servicesOrError = await _serviceRepository.getServicesNear();
    _servicesOrError.fold((error) => null, (r) {
      services.addAll(r);
    });
    resetPageState();
  }

  Future<void> likeService() async {
    showLoading();
    stController.next(swipeDirection: SwipeDirection.right);
    if (services.isNotEmpty && stController.currentIndex <= services.length - 1) {
      if (!_likedSevices.contains(services[stController.currentIndex].id!)) {
        final resultOrError = await _serviceRepository.likeService(services[currentIndexService.value].id!);
        resultOrError.fold((l) => print(l.toString()), (r) {
          _likedSevices.add(r.service.id!);
          print('like service ${stController.currentIndex}');
        });
      }
    }
    resetPageState();
  }

  Future<void> refuseService() async {
    stController.next(swipeDirection: SwipeDirection.left);
    print('refused service ${currentIndexService.value}');
  }

  @override
  void onInit() async {
    await getServicesNear();
    super.onInit();
  }
}
