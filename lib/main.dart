import 'package:flutter/material.dart';
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => dadosEndereco())));
                  },
                  child: const Text('Pagamento')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => login())));
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => cadastroMain())));
                  },
                  child: const Text('cadastro')),
            ],
          ),
        ),
      ),
    );
  }
}
