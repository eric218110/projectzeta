import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class BorderRadiusApplication {
  static var zero = const (
    borderRadius: BorderRadius.all(
      Radius.circular(0),
    ),
  );

  static var sm = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        DimensionApplication.small,
      ),
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

  static var circular = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        DimensionApplication.huge,
      ),
    ),
  );
}
