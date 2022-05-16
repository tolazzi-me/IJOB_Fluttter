import 'package:flutter/material.dart';
import 'package:formulario/Empregado/homeEmpregado.dart';
import 'package:formulario/Empregador/homeEmpregador.dart';

class cadastro3 extends StatelessWidget {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  bool _obscureText = true;
  bool termos = false;

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
                margin: EdgeInsets.only(top: 20),
                height: 300,
                width: double.maxFinite,
                child: PageView.builder(
                    itemCount: images.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Container(
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                          ),
                          const Text('Criando sua conta',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 100),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              homeEmpregado())));
                                }),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amberAccent)),
                                child: const Text('Quero Trabalhar',
                                    style: TextStyle(color: Colors.black))),
                            const SizedBox(height: 40),
                            ElevatedButton(
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              homeEmpregador())));
                                }),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amberAccent)),
                                child: const Text('Quero Empregar',
                                    style: TextStyle(color: Colors.black))),
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
      ),
    );
  }
}
