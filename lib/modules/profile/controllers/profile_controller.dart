import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/model/user_model.dart';

class ProfileController extends BaseController {
  late User? user;
  final avatarPath = ''.obs;

  @override
  void onInit() {
    final localStorage = LocalStorageImp();
    user = localStorage.user;
    super.onInit();
  }

  void importImageProfile() async {
    showLoading();
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      // print(file?.path);
      if (file != null) avatarPath.value = file.path;
    } catch (e) {
      print(e);
      resetPageState();
    }
    resetPageState();
  }
}
