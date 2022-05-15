import 'package:flutter/material.dart';
import 'package:formulario/configuracoes.dart';
import 'package:formulario/login.dart';
import 'package:formulario/dadosEndereco.dart';
import 'package:formulario/cadastro.dart';

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
          title: Text('Teste Menu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Pagamento'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => dadosEndereco())));
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
