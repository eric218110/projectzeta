import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectzeta/src/presentantion/components/icons/name.dart';
import 'package:projectzeta/src/presentantion/components/icons/path.dart';

class EyeOutlineIcon {
  SvgPicture icon({Color? color}) {
    return SvgPicture.asset(
      iconsPaths[IconsName.eyeOutline]!,
      semanticsLabel: 'Eye Outline Icon',
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
