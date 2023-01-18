import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:organiza_mi/bloc/categoria/categoria_event.dart';
import 'package:organiza_mi/bloc/categoria/categoria_state.dart';
import 'package:organiza_mi/models/categoria_model.dart';
import 'package:organiza_mi/repository/categoria_repository.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  //Iniciando variaveis
  TextEditingController pesquisaCtr = TextEditingController(text: '');
  List<CategoriaModel> _categoriaLista = [];
  late Future<List<CategoriaModel>> data;

  final _categoriaRepository = CategoriaRepository();

  CategoriaBloc() : super(CategoriaInitialState()) {
    on<LoadCategoriaEvent>(
      (event, emit) => _categoriaLista.isNotEmpty
          ? emit(CategoriaSuccessState(categoria: _categoriaLista))
          : emit(CategoriaEmptyState()),
    );

    on<SearchCategoriaEvent>(
      (event, emit) => emit(SearchCategoriaState(
          categoria: shearchCategoriaBloc(event.descricao))),
    );
  }

  Future<List<CategoriaModel>> getAllCategoriaBloc() async {
    _categoriaLista = await _categoriaRepository.getAllCategoria();
    return _categoriaLista;
  }

  shearchCategoriaBloc(String descricao) {
    return _categoriaRepository.shearchCategoria(descricao);
  }
}
