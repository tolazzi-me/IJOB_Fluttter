import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/mixin/validations.dart';
import 'package:ijob_app/modules/register/controllers/register_controller.dart';

import 'register_page_three.dart';

class RegisterPageTwo extends BaseView<RegisterController> with CustomValidations {
  final genero = ['Masculino', 'Feminino', 'Prefiro não dizer'];
  final dropGenero = ValueNotifier('');
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  bool termos = false;

  RegisterPageTwo({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 300,
              width: double.maxFinite,
              child: PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Image.asset(
                      images[pagePosition],
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            Container(
              height: 550,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
                child: Form(
                  key: controller.formKeyPageTwo,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                          ),
                          const Text('Criando sua conta', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(labelText: 'Seu melhor e-mail'),
                        validator: isValidEmail,
                        controller: controller.emailTextController,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(labelText: 'Seu número de telefone'),
                        validator: isValidCellPhone,
                        controller: controller.cellPhoneTextController,
                      ),
                      const SizedBox(height: 15),
                      DateTimePicker(
                        textInputAction: TextInputAction.done,
                        dateMask: 'dd/MM/yyyy',
                        initialValue: '',
                        // icon: const Icon(Icons.date_range),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Data de Nascimento',
                        onChanged: (val) {
                          controller.birthDateText.value = DateTime.parse(val);
                        },
                        validator: isValidBirthDate,
                        onSaved: (val) {
                          controller.birthDateText.value = DateTime.parse(val!);
                        },
                      ),
                      const SizedBox(height: 15),
                      ValueListenableBuilder(
                        valueListenable: dropGenero,
                        builder: (BuildContext context, String value, _) {
                          return SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              hint: const Text('Gênero', style: TextStyle(fontSize: 20)),
                              value: (value.isEmpty) ? null : value,
                              onChanged: (escolha) {
                                dropGenero.value = escolha.toString();
                                controller.genre.value = escolha.toString();
                              },
                              validator: (val) {
                                if (val == null) {
                                  return 'Ops, o gênero não é válido';
                                }
                                return null;
                              },
                              items: genero
                                  .map(
                                    (op) => DropdownMenuItem(
                                      value: op,
                                      child: Text(op),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 40,
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.formKeyPageTwo.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => RegisterPageThree()),
                                        ),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                                  child: const Text(
                                    'Continuar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
