import 'package:organiza_mi/models/categoria_model.dart';

abstract class CategoriaState {
  List<CategoriaModel> categoria;

  CategoriaState({
    required this.categoria,
  });
}

class CategoriaInitialState extends CategoriaState {
  CategoriaInitialState() : super(categoria: []);
}

class CategoriaSuccessState extends CategoriaState {
  CategoriaSuccessState({required List<CategoriaModel> categoria})
      : super(categoria: categoria);
}

class SearchCategoriaState extends CategoriaState {
  SearchCategoriaState({required List<CategoriaModel> categoria})
      : super(categoria: categoria);
}

class CategoriaEmptyState extends CategoriaState {
  CategoriaEmptyState() : super(categoria: []);
}
