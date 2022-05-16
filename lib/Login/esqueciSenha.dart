import 'package:flutter/material.dart';

class esqueciSenha extends StatefulWidget {
  _esqueciSenha createState() => _esqueciSenha();
}

class _esqueciSenha extends State<esqueciSenha> {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];

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
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Esqueceu sua senha?',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const Text(
                        'Não se preocupe, é só colocar seu Email aqui e enviaremos para você uma mensagem possibilitando a troca da sua senha.',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      const SizedBox(height: 40),
                      const Text('Insira seu Email',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const TextField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.amberAccent)),
                              child: const Text('Enviar',
                                  style: TextStyle(color: Colors.black))),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey)),
                              child: const Text('Voltar',
                                  style: TextStyle(color: Colors.white))),
                        ],
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
