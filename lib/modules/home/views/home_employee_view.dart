import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/widget/custom_app_bar.dart';

import '../../../routes/app_pages.dart';
import '../widget/drawer.dart';

class HomeEmployeeView extends StatelessWidget {
  const HomeEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerMenu(),
      appBar: CustomAppBar(
        appBarTitleText: 'IJOB',
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: () => Get.toNamed(Routes.profile),
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amberAccent,
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: const DecorationImage(
                  image: NetworkImage("https://images.pexels.com/photos/5804231/pexels-photo-5804231.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 450,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 130,
                    width: 220,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.75), borderRadius: const BorderRadius.only(topLeft: Radius.circular(15))),
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
                  Image.asset('assets/voltar.png', height: 60),
                  Image.asset('assets/recusar.png', height: 80),
                  Image.asset('assets/aceitar.png', height: 80),
                  Image.asset('assets/chat.png', height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
