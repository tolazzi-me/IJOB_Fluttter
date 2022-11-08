import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';
import 'package:ijob_app/modules/Empregado/homeEmpregado.dart';
import 'package:ijob_app/utils/constants.dart';

import '../../../data/repositories/user_repository.dart';

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
    final name = nameTextController.text.split(' ');
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
      firstName: name.first,
      lastName: name.last,
      email: emailTextController.text,
      password: passwordTextController.text,
      bornDate: birthDateText.value,
      cellPhone: '45998237626',
      genre: convertedGenre,
      userActiveType: type.index,
    );
    print(user.toJson());
    final resultOrError = await _userRepository.store(user);
    resultOrError.fold((error) {
      showRedSnackBar('Erro', 'Não foi possível registrar-se tente novamente mais tarde');
    }, (user) {
      // Get.offNamed('/homeEmployee');
      Get.off(homeEmpregado());
      showGreenSnackBar('Olá', 'Registrado com sucesso');
    });
  }
}
