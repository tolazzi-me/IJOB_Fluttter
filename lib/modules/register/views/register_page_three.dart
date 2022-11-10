import 'package:flutter/material.dart';
import 'package:ijob_app/core/base/base_view.dart';
import 'package:ijob_app/modules/register/controllers/register_controller.dart';
import 'package:ijob_app/utils/constants.dart';

import '../../Empregado/homeEmpregado.dart';
import '../../Empregador/homeEmpregador.dart';

class RegisterPageThree extends BaseView<RegisterController> {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
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
              height: 520,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.black),
                        ),
                        const Text('Criando sua conta',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Você pode trocar o tipo de conta a qualquer\nmomento nas configurações!",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: (() {
                                  controller.register(UserActiveType.employee);
                                }),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amberAccent)),
                                child: const Text('Quero Trabalhar',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25))),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            height: 70,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: (() {
                                  controller.register(UserActiveType.employer);
                                }),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amberAccent)),
                                child: const Text('Quero Empregar',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
