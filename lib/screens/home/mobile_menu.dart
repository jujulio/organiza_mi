import 'package:flutter/material.dart';

import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'package:organiza_mi/customs/custom_fontes.dart';

import '/customs/custom_color.dart';
import '/customs/custom_icon.dart';

class MobileMenu extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  MobileMenu({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(
      title: const Text('Grafico', style: styleMenuLabel),
      icon: const Icon(CustomIcons.grafico),
    ),
    TitledNavigationBarItem(
      title: const Text('Financeiro', style: styleMenuLabel),
      icon: const Icon(CustomIcons.financas),
    ),
    TitledNavigationBarItem(
      title: const Text('Rotina', style: styleMenuLabel),
      icon: const Icon(CustomIcons.rotina),
    ),
    TitledNavigationBarItem(
      title: const Text('Tarefa', style: styleMenuLabel),
      icon: const Icon(CustomIcons.tarefa),
    ),
    TitledNavigationBarItem(
      title: const Text('Perfil', style: styleMenuLabel),
      icon: const Icon(CustomIcons.perfil),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TitledBottomNavigationBar(
      currentIndex: currentIndex,
      reverse: false,
      curve: Curves.easeInBack,
      items: items,
      activeColor: colorTheme,
      onTap: onTap,
    );
  }
}
