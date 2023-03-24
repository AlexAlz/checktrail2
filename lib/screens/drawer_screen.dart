import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({super.key, required this.setIndex});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          drawerList(Icons.home, "INICIO", 0),
          drawerList(Icons.healing, "SALUD", 1),
          drawerList(Icons.money, "RENDIMIENTOS", 2),
          drawerList(Icons.monetization_on, "BONOS", 3),
        ],
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, bottom: 15),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
