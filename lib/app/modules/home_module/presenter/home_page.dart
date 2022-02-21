import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

import 'widgets/appbar_home.dart';
import 'widgets/home_tab/body_home.dart';
import 'widgets/investiment_tab/investiment_appbar.dart';
import 'widgets/profile_tab/appbar_profile.dart';
import 'widgets/profile_tab/body_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO (allansrc) implements (got time) controller/store

  int _currentIndex = 0;
  var listBodiesHome = [
    const [
      AppBarHome(),
      BodyHome(),
    ],
    [
      // AppBarHome(),
      InvestimentsPage(),
    ],
    [
      AppBarHome(),
      // BodyHome(),
    ],
    [
      // AppBarHome(),
      BodyHome(),
    ],
    const [
      AppBarProfile(),
      ProfileHome(),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XPColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [...listBodiesHome[_currentIndex]],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: XPColors.backgroundDarker,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              backgroundColor: XPColors.backgroundDarker,
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              backgroundColor: XPColors.backgroundDarker,
              icon: Icon(Icons.auto_graph_rounded),
              label: 'Investir',
            ),
            BottomNavigationBarItem(
              backgroundColor: XPColors.backgroundDarker,
              icon: Icon(Icons.monetization_on_outlined),
              label: 'Conta',
            ),
            BottomNavigationBarItem(
              backgroundColor: XPColors.backgroundDarker,
              icon: Icon(Icons.add_chart_outlined),
              label: 'Bolsa',
            ),
            BottomNavigationBarItem(
              backgroundColor: XPColors.backgroundDarker,
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: XPColors.yellow,
          onTap: (page) {
            setState(() {
              _currentIndex = page;
            });
          },
        ),
      ),
    );
  }
}
