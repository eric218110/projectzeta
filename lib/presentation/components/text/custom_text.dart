import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class CustomText {
  final BuildContext context;

  CustomText({required this.context});

  Widget h6({
    required String text,
    Color? color,
  }) {
    return _buildText(text: text, styleKey: 'h6', color: color);
  }

  Widget h3({
    required String text,
    Color? color,
  }) {
    return _buildText(text: text, styleKey: 'h3', color: color);
  }

  Widget regular({
    required String text,
    Color? color,
  }) {
    return _buildText(text: text, styleKey: 'regular', color: color);
  }

  Widget bodySmall({
    required String text,
    Color? color,
  }) {
    return _buildText(text: text, styleKey: 'body_small', color: color);
  }

  Widget bodyMedium({
    required String text,
    Color? color,
  }) {
    return _buildText(text: text, styleKey: 'body_medium', color: color);
  }

  Widget _buildText({
    required String text,
    required String styleKey,
    Color? color,
  }) {
    return Text(
      text,
      style: _loadStylesByKey(styleKey)?.copyWith(color: color),
    );
  }

  TextStyle? _loadStylesByKey(String key) {
    switch (key) {
      case 'h6':
        return Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 32,
            );
      case 'regular':
        return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 20,
            );
      case 'h3':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            );
      case 'body_small':
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
      case 'body_medium':
        return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            );
      default:
        return Theme.of(context).textTheme.labelMedium;
    }
  }
}
