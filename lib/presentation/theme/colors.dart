import 'package:flutter/material.dart';

class SurfaceColors {
  static Color darkSurface = const Color(0xFF0e0e12); // _100
  static Color pitchBlack = const Color(0xFF000000); // _80
  static Color darkGray = const Color(0xFF1A1A21); // _70
  static Color slateGray = const Color(0xFF303746); // _65
  static Color charcoalGray = const Color(0xFF4e4e61); // _60
  static Color mediumGray = const Color(0xFF666680); // _50
  static Color lightGray = const Color(0xFF83839c); // _40
  static Color lighterGray = const Color(0xFFa2a2b5); // _30
  static Color veryLightGray = const Color(0xFFc1c1cd); // _20
  static Color nearWhite = const Color(0xFFe0e0e6); // _10
  static Color pureWhite = const Color(0xFFffffff); // white
  static Color pureBlack = const Color(0xFF101013); // black
}

class PrimaryColors {
  static Color deepPurple = const Color(0xFF7768D8); // _100
  static Color vibrantPurple = const Color(0xFF7722ff); // _50
  static Color brightPurple = const Color(0xFF924eff); // _20
  static Color softPurple = const Color(0xFFad7bff); // _100_1
  static Color palePurple = const Color(0xFFc9a7ff); // _05
  static Color lightPurple = const Color(0xFFe4d3ff); // _0
}

class AccentColors {
  static Color boldRed = const Color(0xFFFD615B); // p_100
  static Color softRed = const Color(0xFFffa699); // p_50
  static Color paleRed = const Color(0xFFffd2cc); // p_0
  static Color vividGreen = const Color(0xFF00CC7E); // s_100
  static Color lightMint = const Color(0xFFc5eee8); // s_50
  static Color darkInputGray = const Color(0xFF232429); // scroll_input
}

class ActionColors {
  static Color errorRed = const Color(0xFFFF2424); // error
  static Color successGreen = const Color(0xFF37A767); // success
  static Color toastSuccessBackground =
      const Color(0xFF242C32); // toast_success_primary
  static Color toastSuccessAccent =
      const Color(0xFF00DF80); // toast_success_accent
  static Color toastErrorBackground =
      const Color(0xFFF04248); // toast_error_primary
  static Color toastWarningBackground =
      const Color(0xFFFFD21E); // toast_warning_primary
}

class GradientColors {
  static Color translucentGray = const Color(0x4D4e4e61); // linear_0
  static Color semiTransparentGray =
      const Color.fromRGBO(78, 78, 97, 0.35); // linear_1
  static Color borderGray = const Color(0x33cfcffc); // border
  static Color transparent = Colors.transparent; // transparent
}

class RgbaColors {
  static Color lightOverlay = const Color.fromRGBO(78, 78, 97, 0.2); // _100
}

const MaterialColor primarySwatchProjectZeta = MaterialColor(
  _purplePrimaryValue,
  <int, Color>{
    50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Color(_purplePrimaryValue),
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  },
);

const int _purplePrimaryValue = 0xFF7722ff;

class ColorsUtils {
  static Color adjustColor(Color color) => _darkenColor(color, 0.2);

  static Color _darkenColor(Color color, [double amount = 0.2]) {
    assert(amount >= 0 && amount <= 1);

    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;

    final int darkenedR = (r * (1 - amount)).round();
    final int darkenedG = (g * (1 - amount)).round();
    final int darkenedB = (b * (1 - amount)).round();

    return Color.fromARGB(color.alpha, darkenedR, darkenedG, darkenedB);
  }
}
