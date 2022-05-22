import 'package:flutter/material.dart';
import 'package:formulario/Configura%C3%A7%C3%B5es/configuracoes.dart';
import 'package:formulario/Login/login.dart';
import 'package:formulario/Premium/dadosEndereco.dart';
import 'package:formulario/Premium/premium.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste Menu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Premium'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => premium())));
                },
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => login())));
                },
              ),
              ElevatedButton(
                child: const Text('Configurações'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => configuracoesMain())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
