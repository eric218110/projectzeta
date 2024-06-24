import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class CustomText {
  final BuildContext context;

  CustomText({required this.context});

  Widget h6({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'h6',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget h4({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'h4',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget h3({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'h3',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget h2({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'h2',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget regular({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'regular',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget bodySmall({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'body_small',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget bodyMedium({
    required String text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return _buildText(
      text: text,
      styleKey: 'body_medium',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
    );
  }

  Widget _buildText({
    required String text,
    required String styleKey,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: _loadStylesByKey(styleKey)?.copyWith(
        color: color,
        fontSize: fontSize,
      ),
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
      case 'h4':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            );
      case 'h3':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            );
      case 'h2':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 14,
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
