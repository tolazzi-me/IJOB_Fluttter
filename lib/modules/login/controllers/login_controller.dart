import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/network/exceptions/api_exception.dart';
import 'package:ijob_app/utils/constants.dart';

import '../../../data/repositories/user_repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  final headerImages = ['assets/BannerLogin1.png', 'assets/BannerLogin2.png'];
  final UserRepository _userRepository = Get.find(tag: (UserRepository).toString());

  final _passwordHasVisible = false.obs;
  final _emailTextController = TextEditingController().obs;
  final _passwordTextController = TextEditingController().obs;
  final formKeyLogin = GlobalKey<FormState>();

  TextEditingController get emailTextController => _emailTextController.value;
  TextEditingController get passwordTextController => _passwordTextController.value;

  bool get passwordHasVisible => _passwordHasVisible.value;
  set passwordHasVisible(bool value) => _passwordHasVisible.value = value;

  void login() async {
    showLoading();
    final loggedOrError = await _userRepository.login(_emailTextController.value.text, _passwordTextController.value.text);

    loggedOrError.fold((error) {
      if (error is ApiException) {
        switch (error.httpCode) {
          case 400:
            showRedSnackBar('Dados inválidos', 'E-mail ou senha incorretos');
            break;
          case 401:
            showRedSnackBar('Dados inválidos', 'E-mail ou senha incorretos');
            break;
          case 422:
            showRedSnackBar('Dados inválidos', 'E-mail ou senha incorretos');
            break;
          case 404:
            showRedSnackBar('Dados inválidos', 'Usuário não encontrado');
            break;
        }
      } else {
        showRedSnackBar(
          'Erro',
          'Não foi possível realizar login, tente novamente mais tarde',
        );
      }
    }, (token) async {
      final localStorage = LocalStorageImp();
      localStorage.writeToken(token);
      final userOrError = await _userRepository.me();
      userOrError.fold((error) => null, (user) {
        localStorage.write('user', user.toJson());
        Get.offAllNamed(
          user.userActiveType == UserActiveType.employee.index ? Routes.homeEmployee : Routes.homeEmployer,
        );
      });
    });
    resetPageState();
  }
}
