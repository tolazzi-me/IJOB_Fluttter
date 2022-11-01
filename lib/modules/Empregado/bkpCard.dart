import 'package:flutter/material.dart';

class cardTrabalho extends StatefulWidget {
  _cardTrabalho createState() => _cardTrabalho();
}

class _cardTrabalho extends State<cardTrabalho> {
  final title = 'Fotografo';
  final description = 'Procura-se fotografo para casamento';
  final urlImage =
      'https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
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
                        const BorderRadius.only(topLeft: Radius.circular(15))),
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
      ),
    );
  }
}
