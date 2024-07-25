import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Circle extends StatelessWidget {
  final double? diameter;
  final Color? color;
  final double? borderWidth;

  const Circle({
    super.key,
    this.diameter,
    this.color,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter ?? DimensionApplication.base,
      height: diameter ?? DimensionApplication.base,
      decoration: BoxDecoration(
        color: color ?? SurfaceColors.pureWhite,
        shape: BoxShape.circle,
        border: Border.all(
          color: color ?? SurfaceColors.pureWhite,
          width: borderWidth ?? DimensionApplication.base,
        ),
      ),
    );
  }
}
