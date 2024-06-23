import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class CirclesCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(726, -1.5);
    path.cubicTo(726, 173.85, 583.85, 316, 408.5, 316);
    path.cubicTo(233.15, 316, 91, 173.85, 91, -1.5);
    path.cubicTo(91, -176.85, 233.15, -319, 408.5, -319);
    path.cubicTo(583.85, -319, 726, -176.85, 726, -1.5);
    path.close();

    Paint fill = Paint()..style = PaintingStyle.fill;

    fill.color = GradientColors.translucentGray.withOpacity(0.2);

    canvas.drawPath(path, fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclesNoStrokerCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(494.5, 114);
    path.cubicTo(494.5, 250.138, 384.138, 360.5, 248, 360.5);
    path.cubicTo(111.862, 360.5, 1.5, 250.138, 1.5, 114);
    path.cubicTo(1.5, -22.1382, 111.862, -132.5, 248, -132.5);
    path.cubicTo(384.138, -132.5, 494.5, -22.1382, 494.5, 114);
    path.close();

    Paint stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.008333333;

    stroke.color = GradientColors.translucentGray.withOpacity(0.2);

    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
