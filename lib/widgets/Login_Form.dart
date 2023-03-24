import 'package:checktrail/ui/input_decorations.dart';
import 'package:checktrail/widgets/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Iniciar sesión',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: usernameController,
          decoration: buildInputDecoration(context, 'Nombre de usuario'),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: buildInputDecoration(context, 'Contraseña'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final email = usernameController.text.trim();
            final password = passwordController.text.trim();

            final userQuery = await FirebaseFirestore.instance
                .collection('usersBD')
                .where('username', isEqualTo: email)
                .where('password', isEqualTo: password)
                .get();

            if (userQuery.docs.isNotEmpty) {
              // Login successful
              final user = User(
                username: userQuery.docs.first.get('username'),
                // otros campos de usuario necesarios
              );
              // Use Provider to set the user in the app state
              context.read<UserProvider>().setUser(user);
            } else {
              // Login failed
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'El nombre de usuario o la contraseña son incorrectos'),
                ),
              );
            }
          },
          child: Text('Iniciar sesión'),
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text('Crear cuenta'),
        ),
      ],
    );
  }
}

InputDecoration buildInputDecoration(BuildContext context, String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
      color: Colors.grey[700],
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

class User {
  User({required username});
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    print(_user);
    notifyListeners();
  }
}
