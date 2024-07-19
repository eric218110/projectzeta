import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/headers/default/menu_and_bell.dart';
import 'package:projectzeta/presentation/components/headers/default/with_go_back.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class Header extends StatelessWidget {
  final bool isGoBack;
  final String title;

  const Header({
    super.key,
    this.isGoBack = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: DimensionApplication.huge,
        left: DimensionApplication.horizontalPadding,
        right: DimensionApplication.horizontalPadding,
        bottom: DimensionApplication.extraLarge,
      ),
      child: isGoBack ? WithGoBack(title: title) : const MenuAndBell(),
    );
  }
}
