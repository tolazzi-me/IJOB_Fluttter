import 'package:flutter/material.dart';
import 'package:formulario/Perfil/perfil.dart';
import 'package:formulario/widgetAppBar.dart';

class homeEmpregado extends StatelessWidget {
  String imageAceitar = "assets/aceitar.png";
  String imageRecusar = "assets/recusar.png";
  String imageVoltar = "assets/voltar.png";
  String imageChat = "assets/chat.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.amberAccent, Colors.transparent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                        fit: BoxFit.fill)),
                height: 570,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 130,
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Fotografo', style: TextStyle(fontSize: 25)),
                            SizedBox(height: 10),
                            Text('Procura-se fotografo para casamento',
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(imageVoltar, height: 60),
                    Image.asset(imageRecusar, height: 80),
                    Image.asset(imageAceitar, height: 80),
                    Image.asset(imageChat, height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
