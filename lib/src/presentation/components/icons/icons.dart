import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectzeta/src/presentation/components/icons/name.dart';
import 'package:projectzeta/src/presentation/components/icons/path.dart';

class ProjectZetaIcons {
  static var menu = _createIcon(IconsName.menu);
  static var bell = _createIcon(IconsName.bell);
  static var arrowLeft = _createIcon(IconsName.arrowLeft);
  static var eyeOutline = _createIcon(IconsName.eyeOutline);
  static var eyeOffOutline = _createIcon(IconsName.eyeOffOutline);
  static var moneySend = _createIcon(IconsName.moneySend);
  static var moneyReceive = _createIcon(IconsName.moneyReceive);

  static Widget Function({Color? color}) _createIcon(IconsName iconName) {
    return ({Color? color}) => SvgPicture.asset(
          iconsPaths[iconName]!,
          semanticsLabel: '${iconName.toString()} Icon',
          colorFilter: color != null
              ? ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                )
              : null,
        );
  }
}
