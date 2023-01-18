import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:organiza_mi/bloc/categoria/categoria_bloc.dart';
import 'package:organiza_mi/bloc/rotina/rotina_event.dart';
import 'package:organiza_mi/bloc/rotina/rotina_state.dart';
import 'package:organiza_mi/enum/enum_semana.dart';
import 'package:organiza_mi/models/categoria_model.dart';
import 'package:organiza_mi/models/rotina_model.dart';
import 'package:organiza_mi/models/semana_model.dart';
import 'package:organiza_mi/repository/rotina_repository.dart';
import 'package:organiza_mi/screens/Widget/utilities.dart';

class RotinaBloc extends Bloc<RotinaEvent, RotinaState> {
  late TextEditingController descricaoCrt;
  late TextEditingController observacaoCrt;
  late TextEditingController horaInicio;
  late TextEditingController horaTermino;
  late SemanaModel semana;
  late CategoriaModel categoria;

  final _rotinaRepository = RotinaRepository();
  final CategoriaBloc blocCategoria = CategoriaBloc();

  RotinaBloc() : super(RotinaInitialState()) {
    // on<LoadRotinaEvent>(
    //   (event, emit) =>
    //       emit(RotinaSuccessState(rotina:  validaRotinaCriada(event)
    //           )),
    // );
    // on<InsertOrUpdateRotinaEvent>(
    //   (event, emit) => emit(RotinaSuccessState(
    //       rotina: _rotinaRepository.addRotina(event.rotina))),
    // );
    // on<RemoveRotinaEvent>(
    //   (event, emit) => emit(RotinaSuccessState(
    //       rotina: _rotinaRepository.removeRotina(event.rotina))),
    // );
  }

  adicionar() async {
    RotinaModel rotina = RotinaModel(
      idUsuario: "222",
      descricao: descricaoCrt.text,
      observacao: observacaoCrt.text,
      idCategoria: 1,
      horaInicio: DateTime.now(),
      horaTermino: DateTime.now(),
      semana: semana,
    );

    await _rotinaRepository.addRotina(rotina);
  }

  validaRotinaCriada(RotinaModel? rotina) async {
    if (rotina == null) {
      descricaoCrt = TextEditingController(text: '');
      observacaoCrt = TextEditingController(text: '');
      horaInicio = TextEditingController(text: formatTimerOrDate(type: 'T'));
      horaTermino = TextEditingController(text: formatTimerOrDate(type: 'T'));
      semana = SemanaModel();
      categoria = CategoriaModel(
          id: 0,
          descricao: "Outros",
          icone: const Icon(
            Icons.circle,
            size: 37,
            color: Colors.redAccent,
          ));
    } else {
      descricaoCrt.text = rotina.descricao;
      observacaoCrt.text = rotina.observacao!;
      horaInicio.text = rotina.horaInicio.toString();
      horaTermino.text = rotina.horaTermino.toString();
      semana = rotina.semana!;
      categoria = await getCategoriaById(rotina.idCategoria ?? 0);
    }
  }

  Future<CategoriaModel> getCategoriaById(int idCategoria) async {
    final categoriaList = await blocCategoria.getAllCategoriaBloc();
    return categoriaList.where((e) => e.id == idCategoria).first;
  }

  bool inputChipSelecionado(String dia) {
    if (dia == EnumSemana.SEGUNDA.descricao) {
      return semana.isSegunda;
    } else if (dia == EnumSemana.TERCA.descricao) {
      return semana.isTerca;
    } else if (dia == EnumSemana.QUARTA.descricao) {
      return semana.isQuarta;
    } else if (dia == EnumSemana.QUINTA.descricao) {
      return semana.isQuinta;
    } else if (dia == EnumSemana.SEXTA.descricao) {
      return semana.isSexta;
    } else if (dia == EnumSemana.SABADO.descricao) {
      return semana.isSabado;
    } else if (dia == EnumSemana.DOMINGO.descricao) {
      return semana.isDomingo;
    } else {
      return false;
    }
  }

  inputChipOnTap(String dia) {
    if (dia == EnumSemana.SEGUNDA.descricao) {
      semana.isSegunda = !semana.isSegunda;
    } else if (dia == EnumSemana.TERCA.descricao) {
      semana.isTerca = !semana.isTerca;
    } else if (dia == EnumSemana.QUARTA.descricao) {
      semana.isQuarta = !semana.isQuarta;
    } else if (dia == EnumSemana.QUINTA.descricao) {
      semana.isQuinta = !semana.isQuinta;
    } else if (dia == EnumSemana.SEXTA.descricao) {
      semana.isSexta = !semana.isSexta;
    } else if (dia == EnumSemana.SABADO.descricao) {
      semana.isSabado = !semana.isSabado;
    } else if (dia == EnumSemana.DOMINGO.descricao) {
      semana.isDomingo = !semana.isDomingo;
    }
  }
}
