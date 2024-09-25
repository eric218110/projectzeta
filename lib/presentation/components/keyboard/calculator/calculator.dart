import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/keyboard/calculator/rows.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class CalculatorKeyboard extends StatefulWidget {
  const CalculatorKeyboard({super.key});

  @override
  State<CalculatorKeyboard> createState() => _CalculatorKeyboardState();
}

class _CalculatorKeyboardState extends State<CalculatorKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SurfaceColors.darkSurface,
        border: Border(
          top: BorderSide(
            width: 1,
            color: GradientColors.borderGray,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(DimensionApplication.mediumLarge),
          topRight: Radius.circular(DimensionApplication.mediumLarge),
        ),
      ),
      padding: const EdgeInsets.all(DimensionApplication.horizontalPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowTwo(),
          SizedBox(height: DimensionApplication.extraSmall),
          RowThree(),
          SizedBox(height: DimensionApplication.extraSmall),
          RowFour(),
          SizedBox(height: DimensionApplication.extraSmall),
          RowFive(),
          SizedBox(height: DimensionApplication.extraSmall),
          RowSix()
        ],
      ),
    );
  }
}
