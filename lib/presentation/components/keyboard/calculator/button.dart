import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/keyboard/calculator/operations.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class ButtonCalculatorKeyboard extends StatelessWidget {
  final CalculatorOperation operation;

  const ButtonCalculatorKeyboard({
    super.key,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    final widthWithoutPadding = MediaQuery.of(context).size.width -
        (DimensionApplication.horizontalPadding * 2);
    final widthButton = (widthWithoutPadding / 4) - DimensionApplication.tiny;

    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(operation),
        border: Border.all(
          color: _getBorderColor(operation),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(DimensionApplication.mediumTiny),
      ),
      width: widthButton,
      height: DimensionApplication.gigantic,
      child: Center(
        child: CustomText(context: context).h5(
          text: operation.value,
          color: _getTextColor(operation),
        ),
      ),
    );
  }

  Color _getBackgroundColor(CalculatorOperation operation) {
    if (operation.isGreen) return ActionColors.successGreen;
    if (operation.isCyanButtons) return SurfaceColors.charcoalGray;
    return SurfaceColors.darkSurface;
  }

  Color _getTextColor(CalculatorOperation operation) {
    if (operation.isGreen) return SurfaceColors.pureWhite;
    if (operation.isCyanButtons) return SurfaceColors.nearWhite;
    return SurfaceColors.lightGray;
  }

  Color _getBorderColor(CalculatorOperation operation) {
    if (operation.isGreen) return ActionColors.successGreen;
    if (operation.isCyanButtons) return SurfaceColors.lighterGray;
    return GradientColors.borderGray;
  }
}
