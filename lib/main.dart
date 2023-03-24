import 'package:checktrail/screens/creens_barrel.dart';
import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checktrail/screens/salud_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
