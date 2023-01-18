import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  final Function(String)? onChanged;

  const AppBarSearch({
    Key? key,
    this.controller,
    this.onPressed,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: colorGreyDark),
      ),
      child: AppBar(
        backgroundColor: colorTheme,
        toolbarHeight: 80,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: colorWhite,
            ),
            iconSize: 24,
            onPressed: () => Navigator.pop(context)),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: onPressed,
              ),
              hintText: 'Pesquisar...',
              border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
