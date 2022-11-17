import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/routes/app_pages.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/remote/service_remote_data_source.dart';

class HomeEmployerController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final services = <Service>[].obs;
  final imagePath = ''.obs;
  final titleTextController = TextEditingController().obs;
  final descriptionTextController = TextEditingController().obs;

  Future<void> getServices() async {
    final servicesOrError = await _serviceRepository.getServices();
    servicesOrError.fold((error) {
      print(error);
    }, (result) {
      services.clear();
      result.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      services.addAll(result);
    });
  }

  Future<void> importImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) imagePath.value = file.path;
    } catch (e) {
      print(e);
    }
  }

  Future<void> store() async {
    showLoading();
    final createdServiceOrError = await _serviceRepository.store(titleTextController.value.text, descriptionTextController.value.text, File(imagePath.value));
    createdServiceOrError.fold((l) {
      print(l);
      resetPageState();
    }, (service) async {
      print(service.toJson());
      showGreenSnackBar('Sucesso', 'Serviço criado com sucesso');
      await getServices();
      Get.toNamed(Routes.homeEmployer);
    });
    resetPageState();
  }

  @override
  void onInit() async {
    await getServices();
    super.onInit();
  }
}
