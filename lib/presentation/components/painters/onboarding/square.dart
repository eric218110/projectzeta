import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class SquareCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(1.49023, 1);
    path_0.lineTo(114.991, 1);
    path_0.lineTo(172.526, 248.705);
    path_0.lineTo(1.49023, 248.705);
    path_0.lineTo(1.49023, 1);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.008474576;
    paint0Stroke.color = GradientColors.translucentGray.withOpacity(0.2);
    canvas.drawPath(path_0, paint0Stroke);

    Path path_1 = Path();
    path_1.moveTo(173.878, 248.705);
    path_1.lineTo(1.4905, 248.705);
    path_1.lineTo(1.4905, 130.705);
    path_1.lineTo(1.49052, 71.2053);
    path_1.lineTo(1.49051, 41.7053);
    path_1.lineTo(1.49051, 41.7052);
    path_1.lineTo(1.48951, 13.3348);
    path_1.lineTo(233.735, 131.539);
    path_1.lineTo(173.878, 248.705);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.008474576;
    paint1Stroke.color = GradientColors.translucentGray.withOpacity(0.2);
    canvas.drawPath(path_1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
