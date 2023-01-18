import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';
import 'package:organiza_mi/customs/custom_icon.dart';

class ButtonSave extends StatefulWidget {
  final String labelText;
  final VoidCallback? onPressed;

  const ButtonSave({
    Key? key,
    this.labelText = 'Salvar',
    this.onPressed,
  }) : super(key: key);

  @override
  _ButtonSaveState createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0)),
            color: Colors.green,
          ),
          child: CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      CustomIcons.upload,
                      size: 35,
                      color: colorWhite,
                    ),
                  ),
                  Text(
                    widget.labelText,
                    style: const TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontSize: 17.0,
                      color: colorWhite,
                    ),
                  ),
                ],
              ),
              onPressed: widget.onPressed),
        ),
      ],
    );
  }
}
