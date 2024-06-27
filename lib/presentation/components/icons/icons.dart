import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectzeta/presentation/components/icons/name.dart';
import 'package:projectzeta/presentation/components/icons/path.dart';

class ProjectZetaIcons {
  static var menu = _createIcon(IconsName.menu);
  static var bell = _createIcon(IconsName.bell);
  static var arrowLeft = _createIcon(IconsName.arrowLeft);
  static var arrowRight = _createIcon(IconsName.arrowRight);
  static var eyeOutline = _createIcon(IconsName.eyeOutline);
  static var eyeOffOutline = _createIcon(IconsName.eyeOffOutline);
  static var moneySend = _createIcon(IconsName.moneySend);
  static var moneyReceive = _createIcon(IconsName.moneyReceive);
  static var cardPlaceholder = _createIcon(IconsName.moneyReceive);
  static var onBoardingScreenOne = _createIcon(IconsName.onboardingScreenOne);
  static var onBoardingScreenTwo = _createIcon(IconsName.onboardingScreenTwo);
  static var lock = _createIcon(IconsName.lock);
  static var mail = _createIcon(IconsName.mail);

  static Widget Function({Color? color}) _createIcon(IconsName iconName) {
    return ({Color? color}) => SvgPicture.asset(
          iconsPaths[iconName]!,
          semanticsLabel: '${iconName.toString()} Icon',
          width: 10,
          height: 10,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                )
              : null,
        );
  }
}
