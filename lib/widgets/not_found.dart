import 'package:flutter/material.dart';
import 'package:checktrail/widgets/widgets_barrel.dart';

import 'login_card_container.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.yellow,
            ),
            const SizedBox(height: 20),
            Text(
              errorMessage,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const CardContainer(
              child: Text(
                'Aún no cuentas con registros, en cuanto los tengas, los verás en esta sección.',
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
