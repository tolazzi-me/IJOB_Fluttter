import 'dart:io';

import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/model/user_model.dart';

class ProfileController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: (UserRepository).toString());
  late User? user;
  final avatarPath = ''.obs;

  @override
  void onInit() {
    final localStorage = LocalStorageImp();
    user = localStorage.user;
    super.onInit();
  }

  Future<void> changeAvatar() async {}
  void importImageProfile() async {
    showLoading();
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      // print(file?.path);
      if (file != null) {
        final userOrError = await _userRepository.storeAvatar(File(file.path));
        userOrError.fold((error) {
          showRedSnackBar('Erro', 'Não foi possível mudar sua foto');
        }, (user) {
          final _storage = LocalStorageImp();
          _storage.write('user', user.toJson());
        });
        avatarPath.value = file.path;
      }
    } catch (e) {
      print(e);
      resetPageState();
    }
    resetPageState();
  }
}
