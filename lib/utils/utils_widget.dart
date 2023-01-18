import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:organiza_mi/customs/custom_color.dart';
import 'package:organiza_mi/models/categoria_model.dart';
import 'package:organiza_mi/routes/app_routes.dart';

onLoading() {
  return const Center(
    child: CircularProgressIndicator(color: colorTheme),
  );
}

Widget listTileCategory(
    BuildContext context, String descricao, Icon icone, Function() onTap) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: colorGreyDark.withOpacity(0.6)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: ListTile(
        leading: icone,
        title: Text(
          descricao,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 15.0,
            color: colorGreyDark,
          ),
        ),
        onTap: onTap,
      ),
    ),
  );
}
