import 'package:get/instance_manager.dart';
import 'package:ijob_app/modules/liked_services/controller/liked_service_controller.dart';

class LikedServicesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikedServicesController(), fenix: true);
  }
}
