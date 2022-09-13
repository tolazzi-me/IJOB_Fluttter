import 'package:flutter/material.dart';
import 'package:get/get.dart';

class filtroJobs extends StatefulWidget {
  _filtroJobs createState() => _filtroJobs();
}

class _filtroJobs extends State<filtroJobs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('Filtro de Trabalhos',
                style: TextStyle(fontSize: 25, color: Colors.black)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecione os trabalho que deseja ver',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Trabalhos em alta',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [buildTrabalho(), buildTrabalho()],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [buildTrabalho(), buildTrabalho()],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Salvar',
                          style: TextStyle(color: Colors.black, fontSize: 25)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amberAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildTrabalho() => Container(
        height: 110,
        width: 160,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      );
}
