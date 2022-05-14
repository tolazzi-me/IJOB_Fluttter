import 'package:flutter/material.dart';
import 'package:formulario/login.dart';
import 'package:formulario/dadosEndereco.dart';
import 'package:formulario/cadastro.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Teste Menu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => dadosEndereco())));
                  },
                  child: const Text('Pagamentodf')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => login())));
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => cadastro())));
                  },
                  child: const Text('cadastro')),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class dadosEndereco extends StatelessWidget {
  dadosEndereco({Key? key}) : super(key: key);
  final controleNumero = TextEditingController();

  String rua = '';
  String bairro = '';
  String estado = '';
  String cidade = '';
  String complemento = '';
  String numero = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text(
                  'Endereço',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          endereco(),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => _dadosCartao()),
                                    ));
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 255, 214, 62))),
                              child: const Text(
                                'Proximo',
                                style: TextStyle(color: Colors.black),
                              )),
                        ])))));
  }

  Widget endereco() => Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Rua',
            ),
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              rua = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Número'),
            keyboardType: TextInputType.number,
            controller: controleNumero,
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              numero = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Bairro'),
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              bairro = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Estado'),
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              estado = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Cidade'),
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              cidade = text;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Complemento'),
            style: const TextStyle(fontSize: 25),
            onChanged: (text) {
              complemento = text;
            },
          ),
        ],
      );
}

*/
/*
class _dadosCartao extends StatelessWidget {
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
              title: const Text(
                'Informações do Cartão',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dados(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Selecione o plano:',
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: planos(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent)),
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          )),
    );
  }

  Widget dados() => Column(
        children: [
          TextField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              labelText: 'Número do cartão',
              hintText: '0000 0000 0000 0000',
            ),
            inputFormatters: [],
            maxLength: 16,
            keyboardType: TextInputType.number,
            controller: controleNumero,
          ),
          const TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                labelText: 'Nome do titular', hintText: 'Nome completo'),
          ),
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
          TextField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(labelText: 'Validade'),
            keyboardType: TextInputType.number,
            controller: controleValidade,
            maxLength: 4,
          ),
          TextField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(labelText: 'CCV'),
            keyboardType: TextInputType.number,
            controller: controleCCV,
            maxLength: 3,
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
            ],
          ),
          Column(
            children: [
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
            ],
          ),
        ],
      );
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold());
  }
}

*/
