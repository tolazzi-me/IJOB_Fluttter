import 'package:flutter/material.dart';

class homeEmpregado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: Color(0xFFFFD740),
            leadingWidth: 75,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
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
              style: TextStyle(
                  color: Colors.black, fontSize: 80, fontFamily: 'Chopsic'),
            )),
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
            ]),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.amberAccent, Colors.transparent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
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
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Fotografo', style: TextStyle(fontSize: 25)),
                            SizedBox(height: 10),
                            Text('Procura-se fotografo para casamento',
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.grey, size: 60)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.cancel,
                            color: Colors.red, size: 60)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.handshake,
                            color: Colors.green, size: 60)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.chat,
                            color: Colors.cyan, size: 60)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
