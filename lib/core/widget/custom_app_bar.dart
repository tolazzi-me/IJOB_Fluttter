import 'package:flutter/material.dart';
import 'package:ijob_app/core/values/app_colors.dart';

import 'app_bar_title.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitleText;
  final String appBarTitleFontFamily;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Widget? leading;
  final double toolBarHeight;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.leading,
    this.actions,
    this.appBarTitleFontFamily = 'Chopsic',
    this.isBackButtonEnabled = true,
    this.toolBarHeight = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: toolBarHeight,
      automaticallyImplyLeading: isBackButtonEnabled,
      leading: leading,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.blackColor, size: 40),
      title: AppBarTitle(
        text: appBarTitleText,
        fontFamily: appBarTitleFontFamily,
        size: 60,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
