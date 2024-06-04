import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/theme/dimensions.dart';

class BorderRadiusApplication {
  static var zero = const (
    borderRadius: BorderRadius.all(
      Radius.circular(0),
    ),
  );

  static var md = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        DimensionApplication.base,
      ),
    ),
  );

  static var lg = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        DimensionApplication.large,
      ),
    ),
  );
}
