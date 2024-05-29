import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectzeta/src/presentantion/components/icons/icon/eye_off_outline.dart';
import 'package:projectzeta/src/presentantion/components/icons/icon/eye_outline.dart';
import 'package:projectzeta/src/presentantion/components/icons/name.dart';
import 'package:projectzeta/src/presentantion/components/icons/path.dart';

class ProjectZetaIcons {
  static SvgPicture arrowLeft = SvgPicture.asset(
    iconsPaths[IconsName.arrowLeft]!,
    semanticsLabel: 'Arrow Left Icon',
  );

  static SvgPicture bell = SvgPicture.asset(
    iconsPaths[IconsName.bell]!,
    semanticsLabel: 'Bell Icon',
  );

  static SvgPicture menu = SvgPicture.asset(
    iconsPaths[IconsName.menu]!,
    semanticsLabel: 'Menu Icon',
  );

  static SvgPicture Function({Color? color}) eyeOffOutline =
      EyeOffOutlineIcon().icon;

  static SvgPicture Function({Color? color}) eyeOutline = EyeOutlineIcon().icon;
}
