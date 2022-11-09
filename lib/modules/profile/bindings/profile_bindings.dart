import 'package:get/instance_manager.dart';
import 'package:ijob_app/modules/profile/controllers/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
