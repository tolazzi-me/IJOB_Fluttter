import 'package:flutter/material.dart';
import 'package:formulario/widgetAppBar.dart';

import '../Configuracoes/configuracoes.dart';
import '../Premium/premium.dart';

class homeEmpregador extends StatefulWidget {
  _homeEmpregador createState() => _homeEmpregador();
}

class _homeEmpregador extends State<homeEmpregador> {
  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: Drawer(
          backgroundColor: Colors.transparent,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => premium())));
                      },
                      child: const Text('Premium',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => configuracoes())));
                      },
                      child: const Text('Configurações',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => configuracoes())));
                      },
                      child: const Text('Suporte',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: buildAppBar(context),
        floatingActionButton: buildNavigateButton(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Editar",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amberAccent),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Excluir",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amberAccent),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 170,
                        width: 170,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/3992656/pexels-photo-3992656.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Ana Nunes',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Row(
                                children: const [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 170,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Gio Dallas',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              Row(
                                children: const [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 17),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Visualizar mais",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent))),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildNavigateButton() => FloatingActionButton(
      onPressed: () {},
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        color: Colors.black,
      ),
      backgroundColor: Colors.amberAccent);
}
