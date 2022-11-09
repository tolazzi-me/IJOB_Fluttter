import 'package:get/instance_manager.dart';
import 'package:ijob_app/modules/register/controllers/register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
