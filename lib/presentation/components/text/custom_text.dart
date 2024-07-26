import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class CustomText {
  final BuildContext context;

  CustomText({required this.context});

  Widget h6(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h6',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget h4(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h4',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget h3(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h3',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget h2(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h2',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget h1(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h1',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget h5(
      {required String text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return _buildText(
      text: text,
      styleKey: 'h5',
      color: color,
      fontSize: fontSize,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }

  Widget _buildText({
    required String text,
    required String styleKey,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: _loadStylesByKey(
        styleKey,
        fontWeight,
      )?.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  TextStyle? _loadStylesByKey(String key, FontWeight? fontWeight) {
    switch (key) {
      case 'h6':
        return Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 32,
              fontWeight: fontWeight,
            );
      case 'h5':
        return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 20,
              fontWeight: fontWeight,
            );
      case 'h4':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 18,
              fontWeight: fontWeight ?? FontWeight.w600,
            );
      case 'h3':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 16,
              fontWeight: fontWeight ?? FontWeight.w600,
            );
      case 'h2':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 14,
              fontWeight: fontWeight ?? FontWeight.w600,
            );
      case 'h1':
        return Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: SurfaceColors.pureWhite,
              fontSize: 12,
              fontWeight: fontWeight ?? FontWeight.w600,
            );

      default:
        return Theme.of(context).textTheme.labelMedium;
    }
  }
}
