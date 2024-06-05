import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PlaceholderCardPainter extends CustomPainter {
  final Color color;

  PlaceholderCardPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black;

    Paint paint1Fll = Paint()..style = PaintingStyle.fill;
    paint1Fll.color = Colors.white.withOpacity(0.1);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5792683, size.height * -32.17844),
      Offset(size.width * 1.940549, size.height * 1.290410),
      [Colors.white.withOpacity(1), Colors.white.withOpacity(0.04)],
      [0.1, 1],
    );

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.001524390, size.height * 0.8416293);
    path_3.lineTo(size.width * 0.001524390, size.height * 0.1560966);
    path_3.cubicTo(
        size.width * 0.001524390,
        size.height * 0.1192351,
        size.width * 0.001527628,
        size.height * 0.09183415,
        size.width * 0.003296738,
        size.height * 0.07078098);
    path_3.cubicTo(
        size.width * 0.005059939,
        size.height * 0.04979756,
        size.width * 0.008552073,
        size.height * 0.03548488,
        size.width * 0.01536537,
        size.height * 0.02458356);
    path_3.cubicTo(
        size.width * 0.02217869,
        size.height * 0.01368229,
        size.width * 0.03112409,
        size.height * 0.008094829,
        size.width * 0.04423872,
        size.height * 0.005273756);
    path_3.cubicTo(
        size.width * 0.05739695,
        size.height * 0.002443190,
        size.width * 0.07452256,
        size.height * 0.002437980,
        size.width * 0.09756098,
        size.height * 0.002437980);
    path_3.lineTo(size.width * 0.9024390, size.height * 0.002437980);
    path_3.cubicTo(
        size.width * 0.9254787,
        size.height * 0.002437980,
        size.width * 0.9426037,
        size.height * 0.002443190,
        size.width * 0.9557622,
        size.height * 0.005273756);
    path_3.cubicTo(
        size.width * 0.9688750,
        size.height * 0.008094829,
        size.width * 0.9778201,
        size.height * 0.01368229,
        size.width * 0.9846341,
        size.height * 0.02458356);
    path_3.cubicTo(
        size.width * 0.9914482,
        size.height * 0.03548488,
        size.width * 0.9949390,
        size.height * 0.04979756,
        size.width * 0.9967043,
        size.height * 0.07078098);
    path_3.cubicTo(
        size.width * 0.9984726,
        size.height * 0.09183415,
        size.width * 0.9984756,
        size.height * 0.1192351,
        size.width * 0.9984756,
        size.height * 0.1560966);
    path_3.lineTo(size.width * 0.9984756, size.height * 0.8416293);
    path_3.cubicTo(
        size.width * 0.9984756,
        size.height * 0.8784927,
        size.width * 0.9984726,
        size.height * 0.9058927,
        size.width * 0.9967043,
        size.height * 0.9269463);
    path_3.cubicTo(
        size.width * 0.9949390,
        size.height * 0.9479268,
        size.width * 0.9914482,
        size.height * 0.9622439,
        size.width * 0.9846341,
        size.height * 0.9731415);
    path_3.cubicTo(
        size.width * 0.9778201,
        size.height * 0.9840439,
        size.width * 0.9688750,
        size.height * 0.9896341,
        size.width * 0.9557622,
        size.height * 0.9924537);
    path_3.cubicTo(
        size.width * 0.9426037,
        size.height * 0.9952829,
        size.width * 0.9254787,
        size.height * 0.9952878,
        size.width * 0.9024390,
        size.height * 0.9952878);
    path_3.lineTo(size.width * 0.09756098, size.height * 0.9952878);
    path_3.cubicTo(
        size.width * 0.07452256,
        size.height * 0.9952878,
        size.width * 0.05739695,
        size.height * 0.9952829,
        size.width * 0.04423872,
        size.height * 0.9924537);
    path_3.cubicTo(
        size.width * 0.03112409,
        size.height * 0.9896341,
        size.width * 0.02217869,
        size.height * 0.9840439,
        size.width * 0.01536537,
        size.height * 0.9731415);
    path_3.cubicTo(
        size.width * 0.008552073,
        size.height * 0.9622439,
        size.width * 0.005059939,
        size.height * 0.9479268,
        size.width * 0.003296738,
        size.height * 0.9269463);
    path_3.cubicTo(
        size.width * 0.001527628,
        size.height * 0.9058927,
        size.width * 0.001524390,
        size.height * 0.8784927,
        size.width * 0.001524390,
        size.height * 0.8416293);
    path_3.close();

    Paint paint3Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    paint3Stroke.color = color.withOpacity(0.10);

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = color.withOpacity(1.0);

    canvas.drawPath(path_3, paintFill);

    canvas.drawPath(path_3, paint3Stroke);
    canvas.drawCircle(Offset(size.width * 0.1432927, size.height * -0.03641863),
        size.width * 0.3963415, paint1Fll);
    canvas.drawCircle(Offset(size.width * 0.9253049, size.height * 0.4099229),
        size.width * 0.5777439, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
