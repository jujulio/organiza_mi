abstract class CategoriaEvent {}

class LoadCategoriaEvent extends CategoriaEvent {}

class SearchCategoriaEvent extends CategoriaEvent {
  String descricao;

  SearchCategoriaEvent({
    required this.descricao,
  });
}
