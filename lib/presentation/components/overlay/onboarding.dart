import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';

class OverlayOnboarding extends StatelessWidget {
  const OverlayOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 25,
          right: 45,
          child: CustomPaint(
            size: const Size(360, 362),
            painter: CirclesNoStrokerCustomPainter(),
          ),
        ),
        Positioned(
          top: 0,
          child: CustomPaint(
            size: const Size(360, 362),
            painter: CirclesCustomPainter(),
          ),
        ),
        Positioned(
          bottom: -4,
          left: -4,
          child: ClipRect(
            child: CustomPaint(
              size: const Size(236, 250),
              painter: SquareCustomPainter(),
            ),
          ),
        ),
      ],
    );
  }
}
