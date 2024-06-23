import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/dashed_steps/dashed_steps.dart';
import 'package:projectzeta/presentation/components/painters/painters.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
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
              const Positioned.fill(
                child: SafeArea(
                  child: DashedSteps(amountSteps: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
