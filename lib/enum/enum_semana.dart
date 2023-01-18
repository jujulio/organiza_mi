// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum EnumSemana {
  SEGUNDA,
  TERCA,
  QUARTA,
  QUINTA,
  SEXTA,
  SABADO,
  DOMINGO,
}

extension EnumSemanaExtension on EnumSemana {
  String get name => describeEnum(this);

  String get descricao {
    switch (this) {
      case EnumSemana.SEGUNDA:
        return "Seg";
      case EnumSemana.TERCA:
        return "Ter";
      case EnumSemana.QUARTA:
        return "Qua";
      case EnumSemana.QUINTA:
        return "Qui";
      case EnumSemana.SEXTA:
        return "Sex";
      case EnumSemana.SABADO:
        return "Sab";
      case EnumSemana.DOMINGO:
        return "Dom";
      default:
        return "Seg";
    }
  }
}
