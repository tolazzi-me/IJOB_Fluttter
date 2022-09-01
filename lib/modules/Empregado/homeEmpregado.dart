import 'package:flutter/material.dart';
import 'package:ijob_app/modules/premium/views/premium_view.dart';

import '../../widgetAppBar.dart';
import '../Configuracoes/configuracoes.dart';
import '../FiltroJobs/filtroJobs.dart';
import '../Suporte/suporte.dart';

class homeEmpregado extends StatefulWidget {
  _homeEmpregado createState() => _homeEmpregado();
}

class _homeEmpregado extends State<homeEmpregado> {
  String imageAceitar = "assets/aceitar.png";
  String imageRecusar = "assets/recusar.png";
  String imageVoltar = "assets/voltar.png";
  String imageChat = "assets/chat.png";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: buildDrawer(),
        appBar: buildAppBar(context, () => _scaffoldKey.currentState?.openDrawer()),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.amberAccent, Colors.transparent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: const DecorationImage(
                        image:
                            NetworkImage("https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                        fit: BoxFit.fill)),
                height: 570,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 130,
                      width: 220,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.75), borderRadius: const BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Fotografo', style: TextStyle(fontSize: 25)),
                            SizedBox(height: 10),
                            Text('Procura-se fotografo para casamento', style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(imageVoltar, height: 60),
                    Image.asset(imageRecusar, height: 80),
                    Image.asset(imageAceitar, height: 80),
                    Image.asset(imageChat, height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => filtroJobs())));
                    },
                    child: const Text('Filtro de Jobs', style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => PremiumView())));
                    },
                    child: const Text('Premium', style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => configuracoes())));
                    },
                    child: const Text('Configurações', style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => suporte())));
                    },
                    child: const Text('Suporte', style: TextStyle(color: Colors.black, fontSize: 15)),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
