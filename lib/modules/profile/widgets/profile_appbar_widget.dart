import 'package:flutter/material.dart';
import 'package:ijob_app/modules/Chat/chatsPrincipal.dart';

AppBar buildAppBarPerfil(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
    actions: [
      Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
            icon: const Icon(Icons.chat_bubble, color: Colors.black, size: 40),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => chatsMain())));
            },
          )),
    ],
  );
}
