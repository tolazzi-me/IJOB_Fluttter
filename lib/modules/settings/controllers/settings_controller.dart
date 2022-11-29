import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/routes/app_pages.dart';

import '../../../data/repositories/user_repository.dart';

class SettingsController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: (UserRepository).toString());
  final _localStorage = LocalStorageImp();
  final _distance = 1.0.obs;
  final _userActiveTypeSelected = 2.obs;

  double get distance => _distance.value;
  set distance(double value) => _distance.value = value;
  int get userActiveTypeSelected => _userActiveTypeSelected.value;
  set userActiveTypeSelected(int value) => _userActiveTypeSelected.value = value;

  Future<void> logout() async {
    _localStorage.writeToken('');
    _localStorage.write('', null);
    await Get.offAllNamed(Routes.login);
  }

  Future<void> saveDistance() async {
    if (_distance.value != _localStorage.user?.maxDistance) {
      final user = _localStorage.user?.copyWith(maxDistance: _distance.value.toInt());
      _userRepository.updateMaxDistance(_distance.value, user!.id!);
    }
  }

  Future<void> changeUserActiveType() async {
    showLoading();
    await Future.delayed(const Duration(seconds: 1));
    int? isActiveUserType = _localStorage.user?.userActiveType;
    if (_userActiveTypeSelected.value != isActiveUserType && _userActiveTypeSelected.value != 2) {
      final type = _userActiveTypeSelected.value;
      final userOrError = await _userRepository.changeUserType(type, _localStorage.user!.id!);
      userOrError.fold((error) async {
        _userActiveTypeSelected.value = isActiveUserType!;
        await showRedSnackBar('Erro', 'Não foi possível alterar o tipo de conta');
      }, (user) async {
        logout();
      });
    }
    resetPageState();
  }

  @override
  void onInit() {
    super.onInit();
    final _user = _localStorage.user;
    if (_user != null) {
      _distance.value = _user.maxDistance!.toDouble();
      print(_user.userActiveType);
      _userActiveTypeSelected.value = _user.userActiveType;
    }
    debounce(_distance, (_) async => await saveDistance(), time: const Duration(seconds: 5));
  }
}
