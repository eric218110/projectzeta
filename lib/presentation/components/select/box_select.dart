import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/border.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class BoxSelect extends StatelessWidget {
  final Widget child;
  final bool showItems;
  final bool isSelectedOption;

  const BoxSelect({
    super.key,
    required this.child,
    required this.showItems,
    required this.isSelectedOption,
  });

  @override
  Widget build(BuildContext context) {
    if (showItems) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionApplication.base,
        ),
        height: DimensionApplication.huge,
        decoration: BoxDecoration(
          border: Border.all(
            color: PrimaryColors.deepPurple,
            width: 0.5,
          ),
          borderRadius: BorderRadiusApplication.tiny.borderRadius,
        ),
        child: child,
      );
    }

    if (isSelectedOption) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionApplication.base,
        ),
        height: DimensionApplication.huge,
        decoration: BoxDecoration(
          color: AccentColors.darkInputGray,
          border: Border.all(
            color: PrimaryColors.deepPurple,
            width: 0.5,
          ),
          borderRadius: BorderRadiusApplication.tiny.borderRadius,
        ),
        child: child,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.base,
      ),
      height: DimensionApplication.huge,
      decoration: BoxDecoration(
        border: Border.all(
          color: GradientColors.borderGray,
          width: 0.5,
        ),
        borderRadius: BorderRadiusApplication.tiny.borderRadius,
      ),
      child: child,
    );
  }
}
