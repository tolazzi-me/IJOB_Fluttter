import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/local/get_storage.dart';

import '../../../core/model/user_model.dart';

class ProfileController extends BaseController {
  late User user;
  @override
  void onInit() {
    final localStorage = LocalStorageImp();
    user = localStorage.user;
    super.onInit();
  }
}
