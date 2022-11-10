import 'package:flutter/material.dart';
import 'package:ijob_app/modules/premium/views/premium_view.dart';
import 'package:ijob_app/modules/Empregado/CardEmpregado.dart';
import 'package:ijob_app/modules/settings/views/settings_view.dart';

import '../../widgetAppBar.dart';
import '../FiltroJobs/filtroJobs.dart';
import '../Suporte/suporte.dart';

class homeEmpregado extends StatefulWidget {
  _homeEmpregado createState() => _homeEmpregado();
}

class _homeEmpregado extends State<homeEmpregado> {
  final imageAceitar = "assets/aceitar.png";
  String imageRecusar = "assets/recusar.png";
  String imageVoltar = "assets/voltar.png";
  String imageChat = "assets/chat.png";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      endDrawer: buildDrawer(),
      appBar: buildAppBar(context, () => _scaffoldKey.currentState?.openDrawer()),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.amberAccent, Colors.transparent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              JobCard(
                  title: 'Fotografo',
                  description: 'Procura-se fotografo para casamento',
                  urlImage: 'https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
              const SizedBox(height: 15),
              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Ink.image(
              //         image: imageAceitar,
              //         height: 60,
              //         child: InkWell(onTap: onClicked),
              //       ),
              //       Image.asset(imageVoltar, height: 60),
              //       Image.asset(imageRecusar, height: 80),
              //       Image.asset(imageAceitar, height: 80),
              //       Image.asset(imageChat, height: 60),
              //     ],
              //   ),
              // ),
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
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => SettingsView())));
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
