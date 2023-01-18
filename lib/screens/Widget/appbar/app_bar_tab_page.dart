import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class AppBarTabPage extends StatelessWidget implements PreferredSizeWidget {
  final double sizeAppBar;
  final String descricaoPage;
  final List<Widget> tabs;

  const AppBarTabPage({
    key,
    this.sizeAppBar = 100,
    this.tabs = const [],
    required this.descricaoPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorWhite,
      title: Text(
        descricaoPage,
        style: const TextStyle(
          fontFamily: 'OpenSansSemiBold',
          fontSize: 25.0,
          color: colorGreyDark,
        ),
      ),
      bottom: TabBar(
        indicatorColor: colorTheme,
        labelColor: colorGreyDark,
        labelStyle: const TextStyle(
          fontFamily: 'OpenSansSemiBold',
          fontSize: 14.0,
          color: colorGreyDark,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'OpenSansSemiBold',
          fontSize: 14.0,
          color: colorGreyDark,
        ),
        unselectedLabelColor: colorGreyDark,
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(sizeAppBar);
}
