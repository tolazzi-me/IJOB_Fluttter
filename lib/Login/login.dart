import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario/Cadastro/cadastro.dart';
import 'package:formulario/Empregado/homeEmpregado.dart';
import 'package:formulario/Login/esqueciSenha.dart';

class login extends StatefulWidget {
  _login createState() => _login();
}

class _login extends State<login> {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  String loginGoogle = "assets/loginGoogle.png";
  String loginFacebook = "assets/loginFacebook.png";
  String loginLinkedin = "assets/loginLinkedin.png";
  bool _obscureText = true;

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

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
                height: 483,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(labelText: 'Email'),
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
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => esqueciSenha())));
                          },
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(color: Colors.black),
                          )),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => homeEmpregado())));
                            },
                            child: const Text(
                              'Continuar',
                              style: TextStyle(
                                  fontSize: 35, color: Colors.amberAccent),
                            )),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            loginFacebook,
                            height: 75,
                          ),
                          Image.asset(
                            loginGoogle,
                            height: 75,
                          ),
                          Image.asset(
                            loginLinkedin,
                            height: 75,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Novo aqui?',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 17),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              cadastroMain())));
                                },
                                child: const Text('Crie uma conta!',
                                    style: TextStyle(
                                        color: Colors.amberAccent,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 17)))
                          ],
                        ),
                      )
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
