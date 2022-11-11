import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/premium/views/premium_view.dart';
import 'package:ijob_app/modules/settings/views/settings_view.dart';
import 'package:ijob_app/routes/app_pages.dart';

import '../../core/widget/custom_app_bar.dart';
import '../Suporte/suporte.dart';
import '../home/widget/drawer.dart';
import 'addTrabalho.dart';

class HomeEmpregador extends StatefulWidget {
  @override
  _homeEmpregador createState() => _homeEmpregador();
}

class _homeEmpregador extends State<HomeEmpregador> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        endDrawer: const DrawerMenu(),
        appBar: CustomAppBar(
          appBarTitleText: 'IJOB',
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              onPressed: () => Get.toNamed(Routes.chat),
              icon: const Icon(
                Icons.chat,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
        floatingActionButton: buildNavigateButton(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Vaga para fotógrafo',
                      style: TextStyle(fontSize: 20)),
                  children: [
                    Container(
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
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
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
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
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
                              InkWell(
                                onTap: () => {openContato()},
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.pexels.com/photos/3992656/pexels-photo-3992656.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Ana Nunes',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
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
                              ),
                              InkWell(
                                onTap: () => {openContato()},
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Gio Dallas',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text("Visualizar mais",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.amberAccent))),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Vaga para modelo',
                      style: TextStyle(fontSize: 20)),
                  children: [
                    Container(
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
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
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
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
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
                              InkWell(
                                onTap: () => {openContato()},
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.pexels.com/photos/3992656/pexels-photo-3992656.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Ana Nunes',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
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
                              ),
                              InkWell(
                                onTap: () => {openContato()},
                                child: Container(
                                  height: 170,
                                  width: 170,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Gio Dallas',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)),
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text("Visualizar mais",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.amberAccent))),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Drawer buildDrawer() => Drawer(
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
                              builder: ((context) => PremiumView())));
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
                              builder: ((context) => SettingsView())));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => suporte())));
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
      );

  Widget buildNavigateButton() => FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => addTrabalho())));
      },
      child: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => addTrabalho())));
        },
        icon: const Icon(Icons.add),
        color: Colors.black,
      ),
      backgroundColor: Colors.amberAccent);

  Future openContato() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 200,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                const Text(
                  'Número:\n(42)991633013 \n\nEmail:\nananunes@gmail.com',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 15),
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
