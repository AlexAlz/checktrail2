import 'package:checktrail/screens/creens_barrel.dart';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

class RendimientoScreen extends StatefulWidget {
  const RendimientoScreen({super.key, required this.title});
  final String title;

  @override
  State<RendimientoScreen> createState() => _RendimientoScreenState();
}

class _RendimientoScreenState extends State<RendimientoScreen> {
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
