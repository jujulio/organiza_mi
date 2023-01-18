import 'package:flutter/material.dart';

import 'package:organiza_mi/customs/custom_color.dart';

class MessageEmpty extends StatelessWidget {
  final String descricao;
  const MessageEmpty({Key? key, required this.descricao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/not-result.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Não foi encontrado nenhuma $descricao!',
              style: const TextStyle(
                fontFamily: 'OpenSansSemiBold',
                fontSize: 20.0,
                color: colorGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
