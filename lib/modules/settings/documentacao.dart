import 'package:flutter/material.dart';

class documentacao extends StatefulWidget {
  _documentacao createState() => _documentacao();
}

class _documentacao extends State<documentacao> {
  bool _obscureTextAtual = true;
  bool _obscureTextNova = true;
  bool autenticacao = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Documentação e Segurança',
            style: TextStyle(fontSize: 25, color: Colors.black),
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
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dados opcionais',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  '   Alguns dos seus dados podem ser fornecidos opcionalmente, assim aprimoramos a segurança de todos e você ainda é melhor recomendado para os trabalhos',
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                const SizedBox(height: 20),
                const Text(
                  '   Toque na imagem para adicionar uma foto',
                  style: TextStyle(fontSize: 15),
                ),
                Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80, 30, 80, 30),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                const Text(
                  'Trocar senha',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Senha atual',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextAtual = !_obscureTextAtual;
                          });
                        },
                        child: Icon(_obscureTextAtual
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  obscureText: _obscureTextAtual,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Nova senha',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextNova = !_obscureTextNova;
                          });
                        },
                        child: Icon(_obscureTextNova
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  obscureText: _obscureTextNova,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      labelText: 'Nova senha novamente',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextNova = !_obscureTextNova;
                          });
                        },
                        child: Icon(_obscureTextNova
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  obscureText: _obscureTextNova,
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 270,
                    child: ElevatedButton(
                        onPressed: () {
                          openConfirmadoSenha();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amberAccent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Text(
                          'Confirmar nova senha',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Autenticação em dois fatores',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                        value: autenticacao,
                        activeColor: Colors.amberAccent,
                        onChanged: (bool estado) => {
                              setState(() {
                                autenticacao = estado;
                              }),
                            }),
                  ],
                ),
                const Text(
                  'Essa funcionalidade permite que você adicione uma camada extra de segurança na sua conta, depois de ativada, toda vez que um novo aparelho tentar entrar na sua conta um código será solicitado.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openConfirmadoSenha() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                const Text(
                  'Nova senha confirmada',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
