import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class TextFormFieldDataAndTimer extends StatelessWidget {
  final String descricao;
  final IconData? icon;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final VoidCallback? onTap;

  const TextFormFieldDataAndTimer({
    Key? key,
    this.descricao = '',
    this.icon,
    this.controller,
    this.onSaved,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          descricao,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 15.0,
            color: colorGreyDark,
          ),
        ),
        Container(
          width: 145,
          height: 40,
          decoration: BoxDecoration(
            border:
                Border.all(color: colorGreyDark.withOpacity(0.6), width: 1.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextFormField(
            onSaved: onSaved,
            readOnly: true,
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: colorGreyDark,
                size: 20,
              ),
            ),
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
