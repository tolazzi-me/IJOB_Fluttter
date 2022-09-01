import 'package:flutter/material.dart';

class configuracoes extends StatefulWidget {
  _configuracoes createState() => _configuracoes();
}

class _configuracoes extends State<configuracoes> {
  double distancia = 100;
  bool tipoUsuario = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Configurações',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                const Text("Tipo de conta", style: TextStyle(fontSize: 25)),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                buildConfiguracoes(),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 170,
                    child: ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 214, 62))),
                        child: const Text(
                          'Redefinir',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildConfiguracoes() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
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
          Row(children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(Icons.dark_mode, size: 50),
            ),
            Text("Tema escuro", style: TextStyle(fontSize: 20))
          ]),
          const SizedBox(height: 10),
          Row(children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(Icons.notifications, size: 50),
            ),
            Text("Desativar notificações", style: TextStyle(fontSize: 20))
          ]),
          const SizedBox(height: 10),
          Row(children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(Icons.first_page, size: 50),
            ),
            Text("Sair da conta", style: TextStyle(fontSize: 20))
          ]),
          const SizedBox(height: 10),
          Row(children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Icon(Icons.cancel, size: 50),
            ),
            Text("Excluir conta", style: TextStyle(fontSize: 20))
          ]),
        ],
      );
}
