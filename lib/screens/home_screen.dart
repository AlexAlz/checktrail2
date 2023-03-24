import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets_barrel.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
