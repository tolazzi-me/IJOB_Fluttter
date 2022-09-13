import 'package:flutter/material.dart';
import 'package:ijob_app/modules/Perfil/user.dart';
import 'package:ijob_app/modules/Perfil/widgetFoto.dart';
import 'package:ijob_app/modules/Perfil/widgetPerfilAppBar.dart';

import '../Configuracoes/documentacao.dart';
import '../FiltroJobs/filtroJobs.dart';

class perfil extends StatefulWidget {
  @override
  _perfil createState() => _perfil();
}

class _perfil extends State<perfil> {
  @override
  Widget build(BuildContext context) {
    final user = UserDados.myUser;

    return Scaffold(
      appBar: buildAppBarPerfil(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          widgetFoto(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.nome,
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 27),
              Icon(Icons.star, color: Colors.yellow, size: 27),
              Icon(Icons.star, color: Colors.yellow, size: 27),
              Icon(Icons.star, color: Colors.yellow, size: 27),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.bio,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 195, 194, 194),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trabalhos',
                    style: TextStyle(fontSize: 23),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Trabalhos aceitos',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: double.infinity,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => filtroJobs())));
                          },
                          child: const Text(
                            'Filtro de trabalhos',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 195, 194, 194),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Configurações da conta',
                    style: TextStyle(fontSize: 23),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => documentacao())));
                          },
                          child: const Text(
                            'Documentação de segurança',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
