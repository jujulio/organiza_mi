import 'package:flutter/material.dart';

import '/customs/custom_color.dart';
import '/customs/custom_fontes.dart';

class InputChipTab extends StatelessWidget {
  final bool isSelect;
  final String label;
  final VoidCallback? onTap;

  const InputChipTab({
    Key? key,
    this.isSelect = false,
    this.label = 'Seg',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: isSelect ? colorTheme : colorTheme.withOpacity(0.6),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            label,
            style: listTextDefaultChipSemana,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
