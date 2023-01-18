import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class TextFormFieldDefault extends StatelessWidget {
  final int maxLines;
  final int maxLength;
  final String labelText;
  final String helperText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? iconData;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldDefault({
    Key? key,
    this.maxLines = 1,
    this.iconData,
    this.labelText = '',
    this.maxLength = 100,
    this.helperText = '',
    this.keyboardType,
    this.onSaved,
    this.controller,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: colorGreyDark),
      ),
      child: TextFormField(
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        onSaved: onSaved,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 15.0,
            color: colorGreyDark,
          ),
          helperText: helperText,
          helperStyle: const TextStyle(
            fontFamily: 'OpenSansSemiBold',
            fontSize: 14.0,
            color: colorGreyDark,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: colorGreyDark),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }
}
