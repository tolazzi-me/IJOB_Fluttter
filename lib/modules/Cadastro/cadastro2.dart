import 'package:flutter/material.dart';

import 'cadastro3.dart';

class cadastro2 extends StatelessWidget {
  final ano = ['2001', '2002'];
  final mes = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
  final genero = ['Masculino', 'Feminino', 'Prefiro não dizer'];
  final dias = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  final dropAno = ValueNotifier('');
  final dropMes = ValueNotifier('');
  final dropDias = ValueNotifier('');
  final dropGenero = ValueNotifier('');
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          ),
                          const Text('Criando sua conta', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 15),
                      ValueListenableBuilder(
                        valueListenable: dropGenero,
                        builder: (BuildContext context, String value, _) {
                          return SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text('Genero', style: TextStyle(fontSize: 20)),
                              value: (value.isEmpty) ? null : value,
                              onChanged: (escolha) => dropGenero.value = escolha.toString(),
                              items: genero
                                  .map(
                                    (op) => DropdownMenuItem(
                                      value: op,
                                      child: Text(op),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: dropDias,
                            builder: (BuildContext context, String value, _) {
                              return SizedBox(
                                height: 60,
                                child: DropdownButton<String>(
                                  hint: const Text('Dia', style: TextStyle(fontSize: 20)),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) => dropDias.value = escolha.toString(),
                                  items: dias
                                      .map(
                                        (op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: dropMes,
                            builder: (BuildContext context, String value, _) {
                              return SizedBox(
                                height: 60,
                                child: DropdownButton<String>(
                                  hint: const Text('Mês', style: TextStyle(fontSize: 20)),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) => dropMes.value = escolha.toString(),
                                  items: mes
                                      .map(
                                        (op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: dropAno,
                            builder: (BuildContext context, String value, _) {
                              return SizedBox(
                                height: 60,
                                child: DropdownButton<String>(
                                  hint: const Text('Ano', style: TextStyle(fontSize: 20)),
                                  value: (value.isEmpty) ? null : value,
                                  onChanged: (escolha) => dropAno.value = escolha.toString(),
                                  items: ano
                                      .map(
                                        (op) => DropdownMenuItem(
                                          value: op,
                                          child: Text(op),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 40,
                              width: 170,
                              child: ElevatedButton(
                                  onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: ((context) => cadastro3())))},
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
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
