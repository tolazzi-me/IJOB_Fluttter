import 'package:flutter/material.dart';
import 'package:formulario/Perfil/widgetPerfilAppBar.dart';

class perfil extends StatefulWidget {
  _perfil createState() => _perfil();
}

class _perfil extends State<perfil> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [],
        ),
      );
}
