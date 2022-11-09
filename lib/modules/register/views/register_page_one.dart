import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/mixin/validations.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/modules/register/controllers/register_controller.dart';

import 'register_page_two.dart';

class RegisterPageMain extends StatefulWidget {
  const RegisterPageMain({Key? key}) : super(key: key);

  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<RegisterPageMain> with CustomValidations {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  bool _obscureText = true;
  bool termos = false;
  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
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
                      return SizedBox(
                        child: Image.asset(
                          images[pagePosition],
                          fit: BoxFit.cover,
                        ),
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
                    key: _controller.formKeyPageMain,
                    child: SingleChildScrollView(
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
                            decoration: const InputDecoration(labelText: 'Nome Completo'),
                            validator: (val) => combine([
                              () => isNotEmpty(val),
                              () => isValidName(val),
                            ]),
                            controller: _controller.nameTextController,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                labelText: 'Senha',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                                )),
                            obscureText: _obscureText,
                            controller: _controller.passwordTextController,
                            validator: (val) => combine([
                              () => hasSixChars(val),
                              () => isNotEmpty(val),
                              () => passwordHasMatch(
                                    val,
                                    _controller.passwordTextController.text,
                                  )
                            ]),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              labelText: 'Senha novamente',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() => _obscureText = !_obscureText);
                                },
                                child: Icon(
                                  _obscureText ? Icons.visibility : Icons.visibility_off,
                                ),
                              ),
                            ),
                            controller: _controller.repeatPasswordTextController,
                            validator: (val) => passwordHasMatch(
                              val,
                              _controller.passwordTextController.text,
                            ),
                            obscureText: _obscureText,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: termos,
                                onChanged: (valor) {
                                  setState(() => termos = valor!);
                                },
                              ),
                              Text(
                                "Concordar com Termos de Uso \n e Política de Privacidade.",
                                style: TextStyle(color: termos ? Colors.black : Colors.red),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 40,
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_controller.formKeyPageMain.currentState!.validate() && termos) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) => RegisterPageTwo()),
                                          ),
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                        shape:
                                            MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                                    child: const Text(
                                      'Continuar',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
