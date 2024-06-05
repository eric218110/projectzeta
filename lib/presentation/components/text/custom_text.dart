import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class CustomText {
  final BuildContext context;

  CustomText({required this.context});

  h6({
    required String text,
    Color? color,
  }) {
    return Text(
      text,
      style: _loadStylesByKey('h6')?.copyWith(color: color),
    );
  }

  h3({
    required String text,
    Color? color,
  }) {
    return Text(
      text,
      style: _loadStylesByKey('h3')?.copyWith(color: color),
    );
  }

  regular({
    required String text,
    Color? color,
  }) {
    return Text(
      text,
      style: _loadStylesByKey('regular')?.copyWith(color: color),
    );
  }

  bodySmall({
    required String text,
    Color? color,
  }) {
    return Text(
      text,
      style: _loadStylesByKey('body_small')?.copyWith(color: color),
    );
  }

  _loadStylesByKey(String key) {
    Map<String, TextStyle> listItem = {};

    listItem['h1'] = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: SurfaceColors.pureWhite,
          fontSize: 32,
        );

    listItem['regular'] = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: SurfaceColors.pureWhite,
          fontSize: 20,
        );

    listItem['h3'] = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: SurfaceColors.pureWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );

    listItem['body_small'] = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: SurfaceColors.pureWhite,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );

    TextStyle? item = listItem[key];

    if (item == null) {
      return Theme.of(context).textTheme.labelMedium;
    }

    return item;
  }
}
