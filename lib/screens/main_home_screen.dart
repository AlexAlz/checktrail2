import 'package:checktrail/screens/creens_barrel.dart';
import 'package:checktrail/screens/salud_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      slideWidth: 200,
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: const Color.fromARGB(255, 223, 181, 120),
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen(
          title: 'INICIO',
        );
      case 1:
        return const SaludScreen(
          title: 'SALUD',
        );
      case 2:
        return const RendimientoScreen(
          title: 'RENDIMIENTOS',
        );
      case 3:
        return const BonosScreen(
          title: 'BONOS',
        );
      default:
        return const HomeScreen(
          title: '',
        );
    }
  }
}
