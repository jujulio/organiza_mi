import 'package:flutter/material.dart';

import 'package:organiza_mi/screens/rotina/rotina_page.dart';

import '/screens/home/mobile_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> screenApp = [
    Container(),
    Container(),
    const RotinaPage(),
    //const TaskPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenApp[_currentIndex],
      bottomNavigationBar: MobileMenu(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
