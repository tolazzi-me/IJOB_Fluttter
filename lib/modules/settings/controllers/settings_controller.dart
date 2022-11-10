import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/routes/app_pages.dart';

import '../../../data/repositories/user_repository.dart';

class SettingsController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: (UserRepository).toString());
  final _localStorage = LocalStorageImp();
  final _distance = 1.0.obs;
  final _userActiveTypeSelected = false.obs;

  double get distance => _distance.value;
  set distance(double value) => _distance.value = value;
  bool get userActiveTypeSelected => _userActiveTypeSelected.value;
  set userActiveTypeSelected(bool value) => _userActiveTypeSelected.value = value;

  Future<void> logout() async {
    _localStorage.writeToken('');
    _localStorage.write('', null);
    Get.offAllNamed(Routes.login);
  }

  Future<void> saveDistance() async {
    if (_distance.value != _localStorage.user.maxDistance) {
      final user = _localStorage.user.copyWith(maxDistance: _distance.value.toInt());
      _userRepository.updateMaxDistance(_distance.value, user.id!);
    }
  }

  Future<void> changeUserActiveType() async {
    showLoading();
    await Future.delayed(const Duration(seconds: 1));
    bool isActiveUserType = _localStorage.user.userActiveType == 1 ? false : true;
    if (_userActiveTypeSelected.value != isActiveUserType) {
      final type = _userActiveTypeSelected.value == true ? 0 : 1;
      print('changed');
      await _userRepository.changeUserType(type, _localStorage.user.id!);
    }
    resetPageState();
  }

  @override
  void onInit() {
    super.onInit();
    final _user = _localStorage.user;
    _distance.value = _user.maxDistance!.toDouble();
    _userActiveTypeSelected.value = _user.userActiveType == 1 ? false : true;
    debounce(_distance, (_) async => await saveDistance(), time: const Duration(seconds: 5));
  }
}
