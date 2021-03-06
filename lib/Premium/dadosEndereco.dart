import 'package:flutter/material.dart';
import 'package:formulario/Premium/dadosCartao.dart';

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
            centerTitle: true,
            title: const Text(
              'Endereço',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  endereco(),
                  const SizedBox(height: 35),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 170,
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => dadosCartao()))),
                              },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 255, 214, 62))),
                          child: const Text(
                            'Proximo',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                ],
              ),
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
