import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/core/values/app_colors.dart';
import 'package:ijob_app/core/values/app_values.dart';
import 'package:ijob_app/core/values/text_styles.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/modules/register/views/register_page_one.dart';
import 'package:ijob_app/modules/login/controllers/login_controller.dart';
import 'package:ijob_app/modules/login/views/esqueciSenha_view.dart';

import '../../../core/mixin/validations.dart';

class LoginView extends BaseView<LoginController> with CustomValidations {
  LoginView({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppValues.margin_20),
              height: 300,
              width: double.maxFinite,
              child: PageView.builder(
                  itemCount: controller.headerImages.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Image.asset(
                      controller.headerImages[pagePosition],
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValues.radius_25),
                  topRight: Radius.circular(AppValues.radius_25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.emailTextController,
                        validator: (val) => isValidEmail(val, 'Eii, seu e-mail não é válido'),
                        style: blackText18,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () => TextFormField(
                          textInputAction: TextInputAction.done,
                          controller: controller.passwordTextController,
                          validator: hasSixChars,
                          style: blackText18,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            suffixIcon: GestureDetector(
                              onTap: () => controller.passwordHasVisible = !controller.passwordHasVisible,
                              child: Icon(
                                controller.passwordHasVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                          obscureText: !controller.passwordHasVisible,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => esqueciSenha())));
                        },
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(color: Colors.black45, fontSize: 13),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            if (controller.formKeyLogin.currentState!.validate()) {
                              controller.login();
                            }
                          },
                          child: const Text('Continuar', style: yellowText35),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Novo aqui?',
                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 17),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => const RegisterPageMain()),
                                  ),
                                );
                                // go to register page
                              },
                              child: const Text(
                                'Crie uma conta!',
                                style: TextStyle(color: Colors.amberAccent, fontStyle: FontStyle.italic, fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
