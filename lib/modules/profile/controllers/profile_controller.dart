import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/model/user_model.dart';

class ProfileController extends BaseController {
  late User user;
  XFile? imageJob;

  @override
  void onInit() {
    final localStorage = LocalStorageImp();
    user = localStorage.user;
    super.onInit();
  }

  void importImageProfile() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) () => imageJob = file;
    } catch (e) {
      print(e);
    }
  }
}
