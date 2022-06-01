import 'package:flutter/material.dart';
import 'package:formulario/Premium/dadosEndereco.dart';

class premium extends StatefulWidget {
  _premium createState() => _premium();
}

class _premium extends State<premium> {
  List<String> images = [
    "assets/BannerPremium1.png",
    "assets/BannerPremium2.png",
    "assets/BannerPremium3.png",
    "assets/BannerPremium4.png",
  ];
  String vlrUmMes = '9,00';
  String vlrSeisMes = '49,90';
  String vlrAnual = '89,90';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 300,
                width: double.maxFinite,
                child: PageView.builder(
                    itemCount: images.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Container(
                        child: Image.asset(
                          images[pagePosition],
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
              ),
              Container(
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              'Escolha seu plano',
                              style: TextStyle(
                                fontFamily: 'Chopsic',
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Economize na sua primeira compra!',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              height: 20,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('+ VENDIDO',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11)),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                ),
                              ),
                            ),
                            planos(),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'O pagamento será efetuado pela plataforma "GerenciaNet"\nSaiba mais em www.gerencianet.com.br',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Assinando você aceita nossos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'TERMOS',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ))
                              ],
                            ),
                            const SizedBox(height: 35),
                            SizedBox(
                              height: 45,
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              dadosEndereco())));
                                },
                                child: const Text('Assine agora',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(17))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amberAccent)),
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              height: 35,
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Não, Obrigado',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic)),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(17))),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget planos() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('1 Mês',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(
                'R\$ 10,00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text('R\$ $vlrUmMes',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('6 Messes',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(
                'R\$ 55,00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text('R\$ $vlrSeisMes',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Anual',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(
                'R\$ 99,90',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text('R\$ $vlrAnual',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Economize 10%',
                      style: TextStyle(color: Colors.black, fontSize: 11)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
