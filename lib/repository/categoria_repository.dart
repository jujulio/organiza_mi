import 'package:flutter/material.dart';

import 'package:organiza_mi/interfaces/i_categoria.dart';
import 'package:organiza_mi/models/categoria_model.dart';

class CategoriaRepository implements ICategoria {
  final List<CategoriaModel> _categoria = [];
  final double _iconeSize = 37.0;

  @override
  List<CategoriaModel> shearchCategoria(String name) {
    if (name.isEmpty) {
      return _categoria;
    }

    return _categoria
        .where((e) => e.descricao.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  @override
  Future<List<CategoriaModel>> getAllCategoria() async {
    _categoria.addAll([
      CategoriaModel(
        id: 0,
        descricao: 'Outros',
        icone: Icon(
          Icons.circle,
          size: _iconeSize,
          color: Colors.redAccent,
        ),
      ),
      CategoriaModel(
        id: 1,
        descricao: 'Trabalho',
        icone: Icon(
          Icons.work,
          size: _iconeSize,
          color: Colors.black,
        ),
      ),
      CategoriaModel(
        id: 2,
        descricao: 'Estudos',
        icone: Icon(
          Icons.school,
          size: _iconeSize,
          color: Colors.blue,
        ),
      ),
      CategoriaModel(
        id: 3,
        descricao: 'Lazer',
        icone: Icon(
          Icons.local_activity,
          size: _iconeSize,
          color: Colors.green,
        ),
      ),
      CategoriaModel(
        id: 4,
        descricao: 'Saúde',
        icone: Icon(
          Icons.local_hospital,
          size: _iconeSize,
          color: Colors.red,
        ),
      ),
      CategoriaModel(
        id: 5,
        descricao: 'Finanças',
        icone: Icon(
          Icons.attach_money,
          size: _iconeSize,
          color: Colors.deepPurple,
        ),
      ),
      CategoriaModel(
        id: 6,
        descricao: 'Nutrição',
        icone: Icon(
          Icons.local_dining,
          size: _iconeSize,
          color: Colors.redAccent,
        ),
      ),
      CategoriaModel(
        id: 7,
        descricao: 'Esportes',
        icone: Icon(
          Icons.directions_bike,
          size: _iconeSize,
          color: Colors.teal,
        ),
      ),
      CategoriaModel(
        id: 8,
        descricao: 'Treino',
        icone: Icon(
          Icons.fitness_center,
          size: _iconeSize,
          color: Colors.black,
        ),
      ),
      CategoriaModel(
        id: 9,
        descricao: 'Viagem',
        icone: Icon(
          Icons.flight,
          size: _iconeSize,
          color: Colors.blueGrey,
        ),
      ),
      CategoriaModel(
        id: 10,
        descricao: 'Casa',
        icone: Icon(
          Icons.house,
          size: _iconeSize,
          color: Colors.redAccent,
        ),
      ),
      CategoriaModel(
        id: 11,
        descricao: 'Compras',
        icone: Icon(
          Icons.shopping_cart,
          size: _iconeSize,
          color: Colors.amber,
        ),
      ),
      CategoriaModel(
        id: 12,
        descricao: 'Carro',
        icone: Icon(
          Icons.time_to_leave,
          size: _iconeSize,
          color: Colors.black,
        ),
      ),
      CategoriaModel(
        id: 13,
        descricao: 'Meta',
        icone: Icon(
          Icons.star,
          size: _iconeSize,
          color: Colors.yellow,
        ),
      ),
    ]);
    return _categoria;
  }
}
