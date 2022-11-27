import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/local/get_storage.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';
import 'package:ijob_app/routes/app_pages.dart';
import 'package:ijob_app/utils/constants.dart';

import '../../../data/repositories/user_repository.dart';
import '../../../network/exceptions/conflict_exception.dart';

class RegisterController extends BaseController {
  final test = Get.put<UserRemoteDataSource>(
    UserRemoteDataSourceImp(),
    tag: (UserRemoteDataSource).toString(),
  );
  final UserRepository _userRepository = Get.put<UserRepository>(
    UserRepositoryImp(),
    tag: (UserRepository).toString(),
  );
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final birthDateText = DateTime.now().obs;
  final genre = ''.obs;
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();
  final formKeyPageMain = GlobalKey<FormState>();
  final formKeyPageTwo = GlobalKey<FormState>();

  Future<void> register(UserActiveType type) async {
    showLoading();
    final name = nameTextController.text.trim().split(' ');
    var convertedGenre = '';
    switch (genre.value) {
      case 'Masculino':
        convertedGenre = 'M';
        break;
      case 'Feminino':
        convertedGenre = 'F';
        break;

      default:
        convertedGenre = 'N';
        break;
    }

    final user = User(
      firstName: name[0],
      lastName: name.getRange(1, name.length).join(' '),
      email: emailTextController.text,
      password: passwordTextController.text,
      bornDate: birthDateText.value,
      cellPhone: '45998237626',
      genre: convertedGenre,
      userActiveType: type.index,
    );
    final resultOrError = await _userRepository.store(user);
    resultOrError.fold((error) {
      if (error is ConflictException) {
        showRedSnackBar('Erro', 'E-mail em uso');
      } else {
        showRedSnackBar('Erro', 'Não foi possível registrar-se tente novamente mais tarde');
      }
    }, (user) async {
      final localStorage = LocalStorageImp();
      final tokenOrError = await _userRepository.login(emailTextController.text, passwordTextController.text);
      tokenOrError.fold((l) => showRedSnackBar('Erro', 'Não foi possível entrar no sistema'), (r) {
        localStorage.writeToken(r);
        localStorage.write('user', user.toJson());
        if (type.index == 0) {
          Get.offAllNamed(Routes.homeEmployee);
        } else {
          Get.offAllNamed(Routes.homeEmployer);
        }
      });
    });
    resetPageState();
  }
}
