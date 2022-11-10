import 'package:get/instance_manager.dart';
import 'package:ijob_app/modules/settings/controllers/settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(), permanent: true);
  }
}
