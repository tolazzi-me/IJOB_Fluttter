import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';
import 'package:ijob_app/network/exceptions/api_exception.dart';

import '../../../routes/app_pages.dart';

class SplashController extends BaseController {
  final UserRepository _userRepository =
      Get.find(tag: (UserRepository).toString());

  Future<void> getPersonalInfo() async {
    final userOrError = await _userRepository.me();
    userOrError.fold((error) {
      if (error is ApiException) {
        if (error.httpCode == 401) {
          Get.offAllNamed(Routes.login);
        }
      } else {
        Get.snackbar('Erro', 'Não foi possível conectar ao serviço');
      }
    }, (user) {
      // irá para tela de home levando em consideração o tipo de usuário
      Get.offAllNamed(
          user.userActiveType == 0 ? Routes.homeEmployee : Routes.homeEmployer);
    });
  }

  @override
  void onInit() async {
    await getPersonalInfo();
    super.onInit();
  }
}
