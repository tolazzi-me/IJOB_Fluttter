import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario/Empregado/homeEmpregado.dart';

class dadosCartao extends StatelessWidget {
  final controleNumero = TextEditingController();
  final controleCPF = TextEditingController();
  final controleValidade = TextEditingController();
  final controleCCV = TextEditingController();

  String vlrUmMes = '10,00';
  String vlrSeisMes = '49,90';
  String vlrAnual = '99,90';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Informações do Cartão',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dados(),
                  const SizedBox(height: 30),
                  const Text(
                    'Selecione o plano:',
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: planos(),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: 180,
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            homeEmpregado())))
                              },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.amberAccent)),
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget dados() => Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              labelText: 'Número do cartão',
              hintText: '0000 0000 0000 0000',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            maxLength: 16,
            keyboardType: TextInputType.number,
            controller: controleNumero,
          ),
          const TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelText: 'Nome do titular', hintText: 'Nome completo'),
          ),
          const SizedBox(height: 20),
          TextField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              labelText: 'CPF/CNPJ',
              hintText: '000 000 000 00',
            ),
            keyboardType: TextInputType.number,
            controller: controleCPF,
            maxLength: 11,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      labelText: 'Validade', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  controller: controleValidade,
                  maxLength: 4,
                ),
              ),
              SizedBox(
                width: 150,
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CCV',
                      suffixIcon: Icon(Icons.question_mark)),
                  keyboardType: TextInputType.number,
                  controller: controleCCV,
                  maxLength: 3,
                ),
              ),
            ],
          ),
        ],
      );

  Widget planos() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => {},
                child: Text(
                  '1 Mês \n R\$ $vlrUmMes',
                  style: const TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('+ VENDIDO',
                      style: TextStyle(color: Colors.white, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  '6 Messes \n R\$ $vlrSeisMes',
                  style: const TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                onPressed: () => {},
                child: Text(
                  'Anual \n R\$ $vlrAnual',
                  style: const TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
              ),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

/*
         'Anual \n R\$ $vlrAnual',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,





              Text('+ Vendido',
                  style: TextStyle(
                    backgroundColor: Colors.green, //#ffd63e,
                    height: 2,
                  )),
*/
