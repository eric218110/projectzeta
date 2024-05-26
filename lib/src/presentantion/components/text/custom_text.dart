import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/theme/colors.dart';

class CustomText {
  final BuildContext context;
  late Map<String, TextStyle?> _styleByKey;

  CustomText({required this.context}) {
    _populateStyles();
  }

  h6({
    required String text,
    Color? customColor,
  }) {
    return Text(
      text,
      style: _styleByKey['h6']?.copyWith(color: customColor),
    );
  }

  void _populateStyles() {
    _styleByKey['h6'] = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: SurfaceColors.pureWhite,
          fontSize: 32,
        );
  }
}
