import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogBackground extends StatelessWidget {
  final Widget child;

  const LogBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_purpleBox(), const _HeaderIcon(), child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}

class _purpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.4,
            decoration: _upperBackground(),
            child: DotStacks(),
          ),
          AnimatedBackgrnd(size: size),
        ],
      ),
    );
  }

  BoxDecoration _upperBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(27, 116, 199, 1),
            Color.fromRGBO(43, 107, 180, 1),
          ],
        ),
      );
}

class DotStacks extends StatelessWidget {
  const DotStacks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 30,
          child: _Dot(),
        ),
        Positioned(
          top: 40,
          left: 200,
          child: _Dot(),
        ),
        Positioned(
          top: 7,
          left: 90,
          child: _Dot(),
        ),
        Positioned(
          top: 170,
          left: 200,
          child: _Dot(),
        ),
        Positioned(
          top: 200,
          left: 80,
          child: _Dot(),
        ),
        Positioned(
          top: 225,
          left: -20,
          child: _Dot(),
        ),
        Positioned(
          top: 100,
          left: 360,
          child: _Dot(),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: _Dot(),
        ),
      ],
    );
  }
}

class AnimatedBackgrnd extends StatelessWidget {
  const AnimatedBackgrnd({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: double.infinity,
      height: size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.giphy.com/media/ITc8apwvftmKhYdQNb/200.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: Opacity(
        opacity: 0.3,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.indigo,
          //backgroundImage: AssetImage('assets/logo1.png'),
        ),
      ),
    );
  }
}
