import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double size;

  const AppBarTitle({
    Key? key,
    required this.text,
    this.fontFamily,
    this.size = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          height: 1.15,
          color: AppColors.appBarTextColor,
          fontFamily: fontFamily,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
