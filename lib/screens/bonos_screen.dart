import 'package:checktrail/screens/creens_barrel.dart';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

class BonosScreen extends StatefulWidget {
  const BonosScreen({super.key, required this.title});
  final String title;

  @override
  State<BonosScreen> createState() => _BonosScreenState();
}

class _BonosScreenState extends State<BonosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 151, 211),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SimpleAppBar(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CardContainer(
              child: Column(
                children: [
                  Container(height: 150, child: Text("Hola")),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CardContainer(
              child: Column(
                children: [
                  Container(height: 150, child: Text("Hola")),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
