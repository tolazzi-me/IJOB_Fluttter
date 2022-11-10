import 'package:flutter/material.dart';

AppBar appBarChatMain(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 80,
    centerTitle: true,
    title: const Text(
      'Conversas',
      style: TextStyle(fontSize: 35, color: Colors.black),
    ),
    leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
    /*actions: [
      Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_off, color: Colors.black, size: 30),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ],
        ),
      )
    ],*/
  );
}
