import 'package:get/instance_manager.dart';
import 'package:ijob_app/data/remote/service_remote_data_source.dart';
import 'package:ijob_app/modules/home/controller/employee/home_employee_controller.dart';

class HomeEmployeeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeEmployeeController());
  }
}
