import 'package:checktrail/screens/creens_barrel.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CheckTrail',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (context) => const HomeScreen()
      },
    );
  }
}
