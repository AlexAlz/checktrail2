import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_purpleBox(), child],
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
          AnimatedBackgrnd2(size: size),
        ],
      ),
    );
  }
}

class AnimatedBackgrnd2 extends StatelessWidget {
  const AnimatedBackgrnd2({
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
