import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:ijob_app/modules/home/controller/employer/home_employer_controller.dart';

class AddServiceWidget extends BaseView<HomeEmployerController> {
  AddServiceWidget({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final mode = Get.arguments[0] as String;
    final service = Get.arguments[1] as Service?;
    if (mode == 'edit') {
      controller.titleTextController.value.text = service!.title;
      controller.descriptionTextController.value.text = service.description;
      controller.urlImageService.value = service.servicePhotos != null && service.servicePhotos!.isNotEmpty
          ? service.servicePhotos![0].url
          : "https://firebasestorage.googleapis.com/v0/b/ijob-bfe21.appspot.com/o/sem-imagem.png?alt=media&token=afc9df2c-08dc-4556-9e18-fe9dd69cb6e1";
    } else {
      controller.titleTextController.value.text = '';
      controller.descriptionTextController.value.text = '';
      controller.urlImageService.value =
          "https://firebasestorage.googleapis.com/v0/b/ijob-bfe21.appspot.com/o/sem-imagem.png?alt=media&token=afc9df2c-08dc-4556-9e18-fe9dd69cb6e1";
    }
    return WillPopScope(
      onWillPop: () async {
        controller.imagePath.value = '';
        return true;
      },
      child: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => controller.importImage(),
                child: Obx(() {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                      image: controller.imagePath.value.isEmpty
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(controller.urlImageService.value),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(controller.imagePath.value),
                              ),
                            ),
                      color: Colors.black12,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    height: 570,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 190,
                          width: 230,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.75),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: controller.titleTextController.value,
                                    decoration: const InputDecoration(labelText: 'Nome do Trabalho'),
                                    style: const TextStyle(fontSize: 15),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Título inválido';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.descriptionTextController.value,
                                    decoration: const InputDecoration(labelText: 'Descriçao'),
                                    style: const TextStyle(fontSize: 15),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Descrição inválida';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        mode == 'create' ? controller.store() : controller.update();
                      }
                    },
                    child: Text(
                      mode == 'create' ? 'Adicionar' : 'Salvar',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
