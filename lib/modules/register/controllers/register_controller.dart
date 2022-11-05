import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';

import '../../../data/repositories/user_repository.dart';

class RegisterController extends GetxController {
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

  Future<void> register() async {
    final name = nameTextController.text.split(' ');

    final user = User(
      firstName: name.first,
      lastName: name.last,
      email: emailTextController.text,
      bornDate: birthDateText.value,
      cellPhone: '(45) 998237626',
      genre: genre.value,
    );
    final resultOrError = await _userRepository.store(user);
    print(resultOrError);
  }
}
