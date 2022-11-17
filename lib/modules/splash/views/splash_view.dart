import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ijob_app/modules/splash/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SplashController());
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'iJob',
          style: TextStyle(color: Colors.white, fontSize: 100, fontFamily: 'Chopsic'),
        ),
      ),
    );
  }
}
