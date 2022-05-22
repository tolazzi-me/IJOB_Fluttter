import 'package:flutter/material.dart';
import 'package:formulario/Login/login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: login());
  }
}


/*Scaffold(
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
                          builder: ((context) => configuracoes())));
                },
              ),
            ],
          ),
        ),
      ), */