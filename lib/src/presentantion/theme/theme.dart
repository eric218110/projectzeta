import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectzeta/src/presentantion/theme/colors.dart';

class ProjectZetaTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SurfaceColors.pitchBlack,
    primarySwatch: primarySwatchProjectZeta,
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}
