import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/theme/dimensions.dart';

class BorderRadiusApplication {
  static var md = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        DimensionApplication.base,
      ),
    ),
  );
}
