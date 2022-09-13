import 'package:get/get.dart';
import 'package:ijob_app/modules/premium/controllers/premium_controller.dart';

class PremiumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PremiumnController());
  }
}
