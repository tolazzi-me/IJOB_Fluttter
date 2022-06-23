import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ijob_app/core/values/app_colors.dart';
import 'package:ijob_app/routes/app_pages.dart';

import 'bindings/initial_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: AppPages.initial,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        primaryColor: AppColors.colorPrimary,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
