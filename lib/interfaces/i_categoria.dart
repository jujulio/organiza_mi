import 'package:organiza_mi/models/categoria_model.dart';

abstract class ICategoria {
  Future<List<CategoriaModel>> getAllCategoria();
  List<CategoriaModel> shearchCategoria(String descricao);
}
