import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:organiza_mi/bloc/rotina/rotina_bloc.dart';
import 'package:organiza_mi/customs/custom_color.dart';
import 'package:organiza_mi/enum/enum_semana.dart';
import 'package:organiza_mi/models/rotina_model.dart';
import 'package:organiza_mi/routes/app_routes.dart';
import 'package:organiza_mi/screens/Widget/appbar/app_bar_create_page.dart';
import 'package:organiza_mi/utils/utils_widget.dart';

import '../Widget/button/button_save.dart';

import '/customs/custom_color.dart';
import '/customs/custom_icon.dart';
import '../../models/semana_model.dart';
import '/screens/Widget/input_chip_tab.dart';
import '/screens/Widget/textFormField/text_form_field_date_timer.dart';
import '/screens/Widget/textFormField/text_form_field_default.dart';
import '/screens/Widget/utilities.dart';

class CriarRotina extends StatefulWidget {
  final RotinaModel? rotinaDoc;

  const CriarRotina({Key? key, required this.rotinaDoc}) : super(key: key);

  @override
  _CriarRotinaState createState() => _CriarRotinaState();
}

class _CriarRotinaState extends State<CriarRotina> {
  final _formKey = GlobalKey<FormState>();
  late RotinaBloc _bloc;

  @override
  void initState() {
    _bloc = RotinaBloc();
    _bloc.validaRotinaCriada(widget.rotinaDoc);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.descricaoCrt.dispose();
    _bloc.horaInicio.dispose();
    _bloc.horaTermino.dispose();
    _bloc.observacaoCrt.dispose();
    _bloc.semana = SemanaModel();
    super.dispose();
  }

  Widget selectInputChipTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Dias da semana:',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15.0,
              color: colorGreyDark,
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 1,
          children: [
            ...List<Widget>.generate(
                EnumSemana.values.length,
                (index) => InputChipTab(
                      label: EnumSemana.values[index].descricao,
                      isSelect: _bloc.inputChipSelecionado(
                          EnumSemana.values[index].descricao),
                      onTap: () => setState(() {
                        _bloc
                            .inputChipOnTap(EnumSemana.values[index].descricao);
                      }),
                    ))
          ],
        ),
      ],
    );
  }

  Widget formulario() {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 12.0,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormFieldDefault(
                  controller: _bloc.descricaoCrt,
                  labelText: 'Descrição',
                  helperText: 'Descrição da tarefa',
                  maxLines: 1,
                  maxLength: 25,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldDefault(
                  controller: _bloc.observacaoCrt,
                  labelText: 'Observação',
                  helperText: 'Observação da tarefa',
                  maxLines: 2,
                  maxLength: 150,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                listTileCategory(
                  context,
                  _bloc.categoria.descricao,
                  _bloc.categoria.icone,
                  () async {
                    final dynamic item = await Navigator.pushNamed(
                      context,
                      AppRoutes.CATEGORIA,
                    );
                    if (item != null) {
                      setState(() {
                        _bloc.categoria = item;
                      });
                    }
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormFieldDataAndTimer(
                  onSaved: (value) {},
                  descricao: 'Horário de início',
                  icon: CustomIcons.timer,
                  controller: _bloc.horaInicio,
                  onTap: () async {
                    TimeOfDay? pickedTime = await timePicker(context);

                    if (pickedTime != null) {
                      DateTime parsedTime = DateFormat.jm('pt_BR')
                          .parse(pickedTime.format(context).toString());

                      String formattedTime =
                          DateFormat('HH:mm').format(parsedTime);

                      setState(() {
                        _bloc.horaInicio.text = formattedTime;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormFieldDataAndTimer(
                  descricao: 'Horário de término',
                  icon: CustomIcons.timer,
                  controller: _bloc.horaTermino,
                  onTap: () async {
                    TimeOfDay? pickedTime = await timePicker(context);

                    if (pickedTime != null) {
                      DateTime parsedTime = DateFormat.jm('pt_BR')
                          .parse(pickedTime.format(context).toString());

                      String formattedTime =
                          DateFormat('HH:mm').format(parsedTime);

                      setState(() {
                        _bloc.horaTermino.text = formattedTime;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                selectInputChipTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCreatePage(
        title: 'Criar rotina',
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16.0, left: 5.0, right: 5.0),
            color: colorWhite,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [formulario()],
            ),
          ),
          ButtonSave(
            labelText: 'SALVAR ROTINA',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await _bloc.adicionar();
              }
            },
          ),
        ],
      ),
    );
  }
}
