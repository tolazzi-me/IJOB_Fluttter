import 'package:flutter/material.dart';

class login extends StatelessWidget {
  List<String> images = ["assets/BannerLogin1.png", "assets/BannerLogin2.png"];
  bool _obscureText = true;

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
                  padding: const EdgeInsets.all(30),
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
                        style: TextStyle(fontSize: 20),
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
                        obscureText: true,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(color: Colors.black),
                          )),
                      Center(
                        child: TextButton(
                            onPressed: () {},
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
                          Image.network(
                            'https://i.imgur.com/SjwsN5V.png',
                            height: 75,
                          ),
                          Image.network(
                            'https://i.imgur.com/hstdWrp.png',
                            height: 75,
                          ),
                          Image.network(
                            'https://i.imgur.com/JlJQiw9.png',
                            height: 75,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                                onPressed: () {},
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

  void setState(Null Function() param0) {}
}
