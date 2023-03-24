import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final int value;

  const StatusWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define los colores que se corresponden con cada valor
    final Map<int, Color> colorMap = {
      1: Colors.green,
      2: Colors.yellow,
      3: Colors.red,
    };

    // Obtén el color correspondiente al valor
    final Color color = colorMap[value] ?? Colors.grey;

    // Crea el círculo usando el color
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class StatusWidget2 extends StatelessWidget {
  final int value;

  const StatusWidget2({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define los colores que se corresponden con cada valor
    final Map<int, Color> colorMap = {
      1: Colors.green,
      2: Colors.red,
    };

    // Obtén el color correspondiente al valor
    final Color color = colorMap[value] ?? Colors.grey;

    // Crea el círculo usando el color
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class StatusWidget3 extends StatelessWidget {
  final int value;

  const StatusWidget3({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define los colores que se corresponden con cada valor
    final Map<int, Color> colorMap = {
      2: Colors.green,
      1: Colors.red,
    };

    // Obtén el color correspondiente al valor
    final Color color = colorMap[value] ?? Colors.grey;

    // Crea el círculo usando el color
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
