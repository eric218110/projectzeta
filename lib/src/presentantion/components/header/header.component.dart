import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectzeta/src/presentantion/theme/dimensions.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    const menuIcon = 'assets/svg/menu.svg';
    const bellIcon = 'assets/svg/bell.svg';

    return Padding(
      padding: const EdgeInsets.only(
          top: DimensionApplication.massive,
          left: DimensionApplication.horizontalPadding,
          right: DimensionApplication.horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            menuIcon,
            semanticsLabel: menuIcon,
          ),
          SvgPicture.asset(
            bellIcon,
            semanticsLabel: bellIcon,
          )
        ],
      ),
    );
  }
}
