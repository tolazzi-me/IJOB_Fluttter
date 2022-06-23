import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final String? fontFamily;

  const AppBarTitle({
    Key? key,
    required this.text,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.15,
        color: AppColors.appBarTextColor,
        fontFamily: fontFamily,
      ),
      textAlign: TextAlign.center,
    );
  }
}
