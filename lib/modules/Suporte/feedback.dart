import 'package:flutter/material.dart';
import 'package:ijob_app/modules/Suporte/suporte.dart';

class feedback extends StatefulWidget {
  _feedback createState() => _feedback();
}

class _feedback extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Feedback',
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
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const TextField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      labelText: 'Descrição...',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      'Toque aqui para enviar\n    fotos ou arquivos.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      openEmailEnviado();
                    },
                    child: const Text(
                      'Enviar',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openEmailEnviado() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 120,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                const Text(
                  'Email enviado com sucesso',
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
