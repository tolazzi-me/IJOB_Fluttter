import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addTrabalho extends StatefulWidget {
  _addTrabalho createState() => _addTrabalho();
}

class _addTrabalho extends State<addTrabalho> {
  String imageAceitar = "assets/aceitar.png";
  String imageRecusar = "assets/recusar.png";
  String imageVoltar = "assets/voltar.png";
  String imageChat = "assets/chat.png";
  XFile? imageJob;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text('Começar um novo trabalho',
              style: TextStyle(fontSize: 25, color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => {importImage()},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('')),
                      color: Colors.black12,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    height: 570,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 150,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Nome do Trabalho'),
                                    style: TextStyle(fontSize: 15)),
                                SizedBox(height: 10),
                                TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Descriçao'),
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: SizedBox(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Pronto',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amberAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  importImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) setState(() => imageJob = file);
    } catch (e) {
      print(e);
    }
  }
}
