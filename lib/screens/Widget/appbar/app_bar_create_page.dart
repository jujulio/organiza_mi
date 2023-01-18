import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class AppBarCreatePage extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCreatePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTheme,
      toolbarHeight: 60,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: colorWhite,
          ),
          iconSize: 24,
          onPressed: () => Navigator.pop(context)),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'OpenSansSemiBold',
          fontSize: 22.0,
          color: colorWhite,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
