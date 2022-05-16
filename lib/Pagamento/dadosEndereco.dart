import 'package:flutter/material.dart';
import 'package:formulario/Pagamento/dadosCartao.dart';

class dadosEndereco extends StatelessWidget {
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
            backgroundColor: Colors.white,
            title: const Center(
                child: Text(
              'Endereço',
              style: TextStyle(fontSize: 30, color: Colors.black),
            )),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                endereco(),
                ElevatedButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => dadosCartao()))),
                        },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 214, 62))),
                    child: const Text(
                      'Proximo',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          )),
    );
  }

  Widget endereco() => Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Rua',
            ),
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              rua = text;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Número'),
            keyboardType: TextInputType.number,
            controller: controleNumero,
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              numero = text;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Bairro'),
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              bairro = text;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Estado'),
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              estado = text;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Cidade'),
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              cidade = text;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Complemento'),
            style: TextStyle(fontSize: 25),
            onChanged: (text) {
              complemento = text;
            },
          ),
        ],
      );
}
