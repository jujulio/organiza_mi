// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:organiza_mi/bloc/categoria/categoria_bloc.dart';
import 'package:organiza_mi/bloc/categoria/categoria_event.dart';
import 'package:organiza_mi/bloc/categoria/categoria_state.dart';
import 'package:organiza_mi/customs/custom_color.dart';
import 'package:organiza_mi/models/categoria_model.dart';
import 'package:organiza_mi/screens/Widget/appbar/app_bar_search.dart';
import 'package:organiza_mi/screens/Widget/message_not_result.dart';
import 'package:organiza_mi/utils/utils_widget.dart';

class CategoriaPage extends StatefulWidget {
  const CategoriaPage({key}) : super(key: key);

  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  late CategoriaBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CategoriaBloc();
    _bloc.data = _bloc.getAllCategoriaBloc();
  }

  @override
  void dispose() {
    _bloc.pesquisaCtr.dispose();
    _bloc.close();
    super.dispose();
  }

  Widget buildListTileCategoria(CategoriaModel categoria) {
    return ListTile(
      leading: categoria.icone,
      title: Text(
        categoria.descricao,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 15.0,
          color: colorGreyDark,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(categoria);
      },
    );
  }

  categoriaListWidget(CategoriaState state) {
    if (state.categoria.isEmpty) {
      _bloc.emit(CategoriaEmptyState());
      return Container();
    }
    return ListView.builder(
      itemCount: state.categoria.length,
      itemBuilder: (context, int index) {
        return buildListTileCategoria(state.categoria[index]);
      },
      shrinkWrap: true,
    );
  }

  Widget widgetBuildState(CategoriaState state) {
    if (state is CategoriaInitialState) {
      _bloc.add(LoadCategoriaEvent());
    } else if (state is CategoriaSuccessState) {
      return categoriaListWidget(state);
    } else if (state is CategoriaEmptyState) {
      return const MessageEmpty(descricao: 'categoria');
    } else if (state is SearchCategoriaState) {
      return categoriaListWidget(state);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriaBloc, CategoriaState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBarSearch(
                controller: _bloc.pesquisaCtr,
                onChanged: (value) {
                  _bloc.add(
                      SearchCategoriaEvent(descricao: _bloc.pesquisaCtr.text));
                },
                onPressed: () {
                  _bloc.pesquisaCtr.clear();
                  _bloc.add(
                      SearchCategoriaEvent(descricao: _bloc.pesquisaCtr.text));
                }),
            body: FutureBuilder<List<CategoriaModel>>(
                future: _bloc.data,
                initialData: const [],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return onLoading();
                  } else {
                    return widgetBuildState(state);
                  }
                }),
          );
        });
  }
}
