import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cardJobs.dart';

class filtroJobs extends StatefulWidget {
  _filtroJobs createState() => _filtroJobs();
}

class _filtroJobs extends State<filtroJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    buildTrabalho(
                      jobImage:
                          'https://images.pexels.com/photos/4503269/pexels-photo-4503269.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      jobName: 'Jardinagem',
                    ),
                    buildTrabalho(
                      jobImage:
                          'https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      jobName: 'TI',
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    buildTrabalho(
                      jobImage:
                          'https://www.maryhelp.com.br/img/layout/servico/piscineiro.jpg',
                      jobName: 'Piscineiro',
                    ),
                    buildTrabalho(
                      jobImage:
                          'http://s2.glbimg.com/-iAjSgo-VEaDfA3698q1xLzBo0M=/620x453/e.glbimg.com/og/ed/f/original/2016/08/18/baba-cuidando-do-bebe.jpg',
                      jobName: 'Babá',
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  Text(
                    'Mais jobs em breve...',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
