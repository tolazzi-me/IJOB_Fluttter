
/*
import 'package:flutter/material.dart';

class configuracoes extends StatelessWidget {
  double distancia = 100;
  bool tipoUsuario = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Center(
                child: Text(
              'Configurações',
              style: TextStyle(fontSize: 30, color: Colors.black),
            )),
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tipo de conta", style: TextStyle(fontSize: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Empregador", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 10,
                      child: Switch(
                          value: tipoUsuario,
                          activeColor: Colors.amberAccent,
                          onChanged: (bool estado) => {
                                setState(() {
                                  tipoUsuario = estado;
                                }),
                              }),
                    ),
                    const Text("Empregado", style: TextStyle(fontSize: 20))
                  ],
                ),
                _configuracoes(),
                ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 255, 214, 62))),
                    child: const Text(
                      'Redefinir',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          )),
    );
  }

  setState(Null Function() param0) {}
}

  Widget _configuracoes() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(Icons.add_location_rounded, size: 50),
            Column(children: [
              const Text("Distância máxima", style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 260,
                child: Slider(
                    value: distancia,
                    min: 0,
                    max: 100,
                    label: distancia.round().toString(),
                    activeColor: Colors.amberAccent,
                    onChanged: (distancia) =>
                        setState(() => this.distancia = distancia)),
              ),
            ])
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(Icons.dark_mode, size: 50),
            const Text("Tema escuro", style: TextStyle(fontSize: 20))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(Icons.notifications, size: 50),
            const Text("Desativar notificações", style: TextStyle(fontSize: 20))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(Icons.first_page, size: 50),
            const Text("Sair da conta", style: TextStyle(fontSize: 20))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(Icons.cancel, size: 50),
            const Text("Excluir conta", style: TextStyle(fontSize: 20))
          ]),
        ],
      );
}

*/