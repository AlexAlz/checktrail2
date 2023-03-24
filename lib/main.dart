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
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PilotHealth',
        initialRoute: 'login',
        //! Y aquí las rutas de las vistas que usan los providers
        routes: {
          'login': (_) => const LoginScreen(),
          'home': (_) => const MainHome(),
          'salud': (_) => const SaludScreen(
                title: 'Salud',
              ),
          'valoraciones': (_) => ValoracionWidget(),
          'observaciones': (_) => ObservacionWidget(),
          'dictamen': (_) => DictamenWidget(),
          'viajes': (_) => ViajesWidget()
        },
        theme: ThemeData.light(),
      ),
    );
  }
}
