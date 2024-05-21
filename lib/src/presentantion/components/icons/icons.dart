import 'package:flutter_svg/svg.dart';
import 'package:projectzeta/src/presentantion/components/icons/arrow_left.dart';

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
}
