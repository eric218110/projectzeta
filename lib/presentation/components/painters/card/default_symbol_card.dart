import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class DefaultSymbolCard extends CustomPainter {
  final Color color;

  DefaultSymbolCard({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(66.6531, 0.652344);
    path.lineTo(3.3469, 0.652344);
    path.cubicTo(1.49849, 0.652344, 0, 1.81989, 0, 3.26032);
    path.lineTo(0, 38.0441);
    path.cubicTo(0, 39.4846, 1.49849, 40.6523, 3.3469, 40.6523);
    path.lineTo(66.6531, 40.6523);
    path.cubicTo(68.5015, 40.6523, 70, 39.4846, 70, 38.0441);
    path.lineTo(70, 3.26032);
    path.cubicTo(70, 1.81989, 68.5015, 0.652344, 66.6531, 0.652344);
    path.close();
    path.moveTo(17.2949, 34.8214);
    path.lineTo(9.33333, 34.8214);
    path.cubicTo(8.04476, 34.8214, 7, 34.0073, 7, 33.0032);
    path.cubicTo(7, 31.9991, 8.04476, 31.185, 9.33333, 31.185);
    path.lineTo(17.2949, 31.185);
    path.cubicTo(18.5835, 31.185, 19.6283, 31.9991, 19.6283, 33.0032);
    path.cubicTo(19.6283, 34.0073, 18.5835, 34.8214, 17.2949, 34.8214);
    path.close();
    path.moveTo(25.2554, 28.0032);
    path.lineTo(9.33333, 28.0032);
    path.cubicTo(8.04476, 28.0032, 7, 27.1891, 7, 26.185);
    path.cubicTo(7, 25.1809, 8.04476, 24.3668, 9.33333, 24.3668);
    path.lineTo(25.2554, 24.3668);
    path.cubicTo(26.5439, 24.3668, 27.5887, 25.1809, 27.5887, 26.185);
    path.cubicTo(27.5887, 27.1891, 26.5439, 28.0032, 25.2554, 28.0032);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = ColorsUtils.adjustColor(color);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
