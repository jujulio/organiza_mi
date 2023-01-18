import 'package:organiza_mi/models/semana_model.dart';

class RotinaModel {
  String? id;
  String? idUsuario;
  String descricao;
  String? observacao;
  int idCategoria;
  DateTime? horaInicio;
  DateTime? horaTermino;
  SemanaModel? semana;

  RotinaModel({
    this.id,
    this.idUsuario,
    this.descricao = '',
    this.observacao,
    this.idCategoria = 1,
    this.horaInicio,
    this.horaTermino,
    this.semana,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'descricao': descricao,
      'observacao': observacao,
      'idCategoria': idCategoria,
      'horaInicio': horaInicio,
      'horaTermino': horaTermino,
      'semana': semana!.toMap(),
    };
  }
}
