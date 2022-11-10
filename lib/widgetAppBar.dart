import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/Chat/chatsPrincipal.dart';
import 'package:ijob_app/routes/app_pages.dart';

AppBar buildAppBar(BuildContext context, VoidCallback _onPressed) {
  return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: Color(0xFFFFD740),
      leadingWidth: 75,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
            onPressed: () {
              Get.toNamed(Routes.profile);
            },
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 40,
            )),
      ),
      title: const Center(
          child: Text(
        'iJob',
        style: TextStyle(color: Colors.black, fontSize: 80, fontFamily: 'Chopsic'),
      )),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
              onPressed: () {
                () => Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 40,
              )),
        )
      ]);
}

AppBar buildAppBarEmpregador(BuildContext context, VoidCallback _onPressed) {
  return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: Color(0xFFFFD740),
      leadingWidth: 75,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const ChatsMain())));
            },
            icon: const Icon(
              Icons.chat,
              color: Colors.black,
              size: 35,
            )),
      ),
      title: const Center(
          child: Text(
        'iJob',
        style: TextStyle(color: Colors.black, fontSize: 80, fontFamily: 'Chopsic'),
      )),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
              onPressed: () {
                () => Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 40,
              )),
        )
      ]);
}

/*
actions: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 40,
              )),
        )
      ]
*/