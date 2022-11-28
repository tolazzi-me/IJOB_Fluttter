import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/routes/app_pages.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/remote/service_remote_data_source.dart';
import '../../../../network/exceptions/api_exception.dart';

class HomeEmployerController extends BaseController {
  final _serviceRepository = Get.put(ServiceRemoteSourceImp());
  final services = <Service>[].obs;
  final imagePath = ''.obs;
  final titleTextController = TextEditingController().obs;
  final descriptionTextController = TextEditingController().obs;
  final urlImageService = ''.obs;
  var formKey = GlobalKey<FormState>();

  Future<void> getServices() async {
    showLoading();
    final servicesOrError = await _serviceRepository.getServices();
    servicesOrError.fold((error) {
      resetPageState();
      print(error);
    }, (result) {
      services.clear();
      result.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      services.addAll(result);
    });
    resetPageState();
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
    final createdServiceOrError =
        await _serviceRepository.store(titleTextController.value.text.trim(), descriptionTextController.value.text.trim(), File(imagePath.value));
    createdServiceOrError.fold((error) {
      print(error is ApiException);
      if (error is ApiException) {
        switch (error.httpCode) {
          case 409:
            showRedSnackBar('Erro', 'O serviço já existe');
            break;
          case 500:
            showRedSnackBar('Erro', 'Ocorreu um erro interno');
            break;
        }
      }
      resetPageState();
    }, (service) async {
      print(service.toJson());
      showGreenSnackBar('Sucesso', 'Serviço criado com sucesso');
      await getServices();
      titleTextController.value.text = '';
      descriptionTextController.value.text = '';
      imagePath.value = '';
      Get.offNamed(Routes.homeEmployer);
    });
    resetPageState();
  }

  Future<void> updateService() async {
    print('Updating');
  }

  Future<void> deleteService(String serviceId) async {
    showLoading();
    final deletedOrError = await _serviceRepository.deleteService(serviceId);
    deletedOrError.fold((error) async {
      showRedSnackBar('Erro', 'Não foi possível deletar o serviço');
      resetPageState();
    }, (r) async {
      Get.back();
      showGreenSnackBar("Sucesso", r);
      resetPageState();
      await getServices();
    });
    resetPageState();
  }

  @override
  void onInit() async {
    await getServices();
    super.onInit();
  }
}
