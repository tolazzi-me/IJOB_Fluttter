import 'package:flutter/material.dart';

import 'cadastro2.dart';

class cadastroMain extends StatefulWidget {
  cadastro createState() => cadastro();
}

class cadastro extends State<cadastroMain> {
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
                                  fontSize: 30, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(labelText: 'Nome Completo'),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: _obscureText,
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            labelText: 'Senha novamente',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() => _obscureText = !_obscureText);
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
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
                          const Text(
                              "Concordar com Termos de Uso \n e Política de Privacidade.")
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
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    cadastro2())))
                                      },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15))),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.amberAccent)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
