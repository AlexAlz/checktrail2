import 'package:checktrail/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class SimpleAppBar extends StatelessWidget {
  final String title;

  SimpleAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 20, 132, 223),
          border:
              Border(bottom: BorderSide(width: 2.0, color: Colors.black12))),
      child: Row(
        children: [
          const DrawerWidget(),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    fontSize: 26.0),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
