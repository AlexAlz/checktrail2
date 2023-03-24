import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //*------------------------------------------------------
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String activeUser = arguments['activeUser'];
    final String nomina = arguments['nomina'];
    final String area = arguments['area'];
    //*------------------------------------------------------
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
                  Container(
                    height: 50,
                    child: Column(
                      children: [Text(activeUser), Text(nomina), Text(area)],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CardContainer(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: ViajesWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
