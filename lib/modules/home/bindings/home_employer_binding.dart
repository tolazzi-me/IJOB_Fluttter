import 'package:get/instance_manager.dart';
import 'package:ijob_app/modules/home/controller/employer/home_employer_controller.dart';

class HomeEmployerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeEmployerController());
  }
}
