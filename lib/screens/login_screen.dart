import 'package:checktrail/screens/creens_barrel.dart';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final user =
      TextEditingController(); // ?se crea un controlador para el campo de texto para guardar el texto ingresado en el textfield usuario
  final password =
      TextEditingController(); // ?se crea un controlador para el campo de texto para guardar el texto ingresado en el textfield contraseña

  final String _user = '';
  final String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'INICIO DE SESIÓN',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
