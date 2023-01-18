import 'package:flutter/material.dart';

import 'package:organiza_mi/routes/app_routes.dart';
import 'package:organiza_mi/screens/Widget/appbar/app_bar_tab_page.dart';

import '/customs/custom_color.dart';
import '/customs/custom_icon.dart';

class RotinaPage extends StatefulWidget {
  const RotinaPage({Key? key}) : super(key: key);

  @override
  _RotinaPageState createState() => _RotinaPageState();
}

class _RotinaPageState extends State<RotinaPage> {
  Widget cardInformation() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 15.0,
        color: colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 150,
          height: 200,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: const AppBarTabPage(
            descricaoPage: 'Rotinas',
            sizeAppBar: 110,
            tabs: [
              Tab(text: 'SEGUNDA-FEIRA'),
              Tab(text: 'TERÇA-FEIRA'),
              Tab(text: 'QUARTA-FEIRA'),
              Tab(text: 'QUINTA-FEIRA'),
              Tab(text: 'SEXTA-FEIRA'),
              Tab(text: 'SÁBADO'),
              Tab(text: 'DOMINGO'),
            ]),
        body: ListView.separated(
            itemBuilder: ((context, index) {
              return cardInformation();
            }),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 5),
        // body: const TabBarView(
        //   children: [
        //     Icon(Icons.directions_car),
        //     Icon(Icons.directions_transit),
        //     Icon(Icons.directions_bike),
        //     Icon(Icons.directions_car),
        //     Icon(Icons.directions_transit),
        //     Icon(Icons.directions_bike),
        //     Icon(Icons.directions_bike),
        //   ],
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SizedBox(
          height: 60.0,
          width: 60.0,
          child: FloatingActionButton(
              backgroundColor: colorTheme,
              child: const Icon(
                CustomIcons.add,
                color: colorWhite,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.CRIAR_ROTINA,
                );
              }),
        ),
      ),
    );
  }
}
