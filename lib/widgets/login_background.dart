import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _purpleBox(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            //height: 200,
            //color: Colors.amber,
            child: const ClipOval(
              child: CircleAvatar(
                radius: 110.1,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/logo1.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _purpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _upperBackground(),
      child: Stack(
        children: [
          Positioned(
            child: _Dot(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Dot(),
            top: -40,
            left: 400,
          ),
          Positioned(
            child: _Dot(),
            top: -60,
            left: 130,
          ),
          Positioned(
            child: _Dot(),
            top: 200,
            left: 200,
          ),
          Positioned(
            child: _Dot(),
            top: 260,
            left: 380,
          ),
          Positioned(
            child: _Dot(),
            top: 100,
            left: 380,
          ),
        ],
      ),
    );
  }

  BoxDecoration _upperBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      );
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
