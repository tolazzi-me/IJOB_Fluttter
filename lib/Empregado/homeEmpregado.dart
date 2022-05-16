import 'package:flutter/material.dart';

class homeEmpregado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Color(0xFFFFD740)),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 40,
            ),
          ),
          title: const Center(
            child: Text(
              'iJob',
              style: TextStyle(
                  color: Colors.black, fontSize: 65, fontFamily: 'Chopsic'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: Column(
                      children: [
                        Image.network(
                            "https://images.pexels.com/photos/8453599/pexels-photo-8453599.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 60,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 60,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.handshake,
                          color: Colors.green,
                          size: 60,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.chat,
                          color: Colors.cyan,
                          size: 60,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
