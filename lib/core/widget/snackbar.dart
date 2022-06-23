import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showRedSnackBar(String title, String message) async {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.redAccent,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 30,
      left: 10,
      right: 10,
    ),
  );
}

Future<void> showGreenSnackBar(String title, String message) async {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.only(
      bottom: 30,
      left: 10,
      right: 10,
    ),
  );
}
