import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/mixin/validations.dart';
import 'package:ijob_app/modules/register/controllers/register_controller.dart';

import 'register_page_three.dart';

class RegisterPageTwo extends StatelessWidget with CustomValidations {
  final genero = ['Masculino', 'Feminino', 'Prefiro não dizer'];
  // final ano = ['2001', '2002'];
  // final mes = [
  //   'Janeiro',
  //   'Fevereiro',
  //   'Março',
  //   'Abril',
  //   'Maio',
  //   'Junho',
  //   'Julho',
  //   'Agosto',
  //   'Setembro',
  //   'Outubro',
  //   'Novembro',
  //   'Dezembro'
  // ];
  // final dias = [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10',
  //   '11',
  //   '12',
  //   '13',
  //   '14',
  //   '15',
  //   '16',
  //   '17',
  //   '18',
  //   '19',
  //   '20',
  //   '21',
  //   '22',
  //   '23',
  //   '24',
  //   '25',
  //   '26',
  //   '27',
  //   '28',
  //   '29',
  //   '30',
  //   '31'
  // ];
  // final dropAno = ValueNotifier('');
  // final dropMes = ValueNotifier('');
  // final dropDias = ValueNotifier('');
  final dropGenero = ValueNotifier('');
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  bool termos = false;

  RegisterPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RegisterController());
    return MaterialApp(
      home: Scaffold(
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
                height: 520,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
                  child: Form(
                    key: _controller.formKeyPageTwo,
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
                            const Text('Criando sua conta', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: isValidEmail,
                          controller: _controller.emailTextController,
                        ),
                        const SizedBox(height: 15),
                        ValueListenableBuilder(
                          valueListenable: dropGenero,
                          builder: (BuildContext context, String value, _) {
                            return SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text('Genero', style: TextStyle(fontSize: 20)),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (escolha) {
                                  dropGenero.value = escolha.toString();
                                  _controller.genre.value = escolha.toString();
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
                        const SizedBox(height: 15),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     ValueListenableBuilder(
                        //       valueListenable: dropDias,
                        //       builder: (BuildContext context, String value, _) {
                        //         return SizedBox(
                        //           height: 60,
                        //           child: DropdownButton<String>(
                        //             hint: const Text('Dia',
                        //                 style: TextStyle(fontSize: 20)),
                        //             value: (value.isEmpty) ? null : value,
                        //             onChanged: (escolha) =>
                        //                 dropDias.value = escolha.toString(),
                        //             items: dias
                        //                 .map(
                        //                   (op) => DropdownMenuItem(
                        //                     value: op,
                        //                     child: Text(op),
                        //                   ),
                        //                 )
                        //                 .toList(),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //     ValueListenableBuilder(
                        //       valueListenable: dropMes,
                        //       builder: (BuildContext context, String value, _) {
                        //         return SizedBox(
                        //           height: 60,
                        //           child: DropdownButton<String>(
                        //             hint: const Text('Mês',
                        //                 style: TextStyle(fontSize: 20)),
                        //             value: (value.isEmpty) ? null : value,
                        //             onChanged: (escolha) =>
                        //                 dropMes.value = escolha.toString(),
                        //             items: mes
                        //                 .map(
                        //                   (op) => DropdownMenuItem(
                        //                     value: op,
                        //                     child: Text(op),
                        //                   ),
                        //                 )
                        //                 .toList(),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //     ValueListenableBuilder(
                        //       valueListenable: dropAno,
                        //       builder: (BuildContext context, String value, _) {
                        //         return SizedBox(
                        //           height: 60,
                        //           child: DropdownButton<String>(
                        //             hint: const Text('Ano',
                        //                 style: TextStyle(fontSize: 20)),
                        //             value: (value.isEmpty) ? null : value,
                        //             onChanged: (escolha) =>
                        //                 dropAno.value = escolha.toString(),
                        //             items: ano
                        //                 .map(
                        //                   (op) => DropdownMenuItem(
                        //                     value: op,
                        //                     child: Text(op),
                        //                   ),
                        //                 )
                        //                 .toList(),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ],
                        // ),
                        DateTimePicker(
                          dateMask: 'dd/MM/yyyy',
                          initialValue: '',
                          // icon: const Icon(Icons.date_range),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          dateLabelText: 'Data de Nascimento',
                          onChanged: (val) => print(val),
                          validator: isValidBirthDate,
                          onSaved: (val) => _controller.birthDateText.value = DateTime.parse(val!),
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
                                      if (_controller.formKeyPageTwo.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) => RegisterPageThree()),
                                          ),
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
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
      ),
    );
  }
}
