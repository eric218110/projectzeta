import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/keyboard/calculator/calculator.dart';

class CalculatorBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (context) => const Wrap(
        children: [
          CalculatorKeyboard(),
        ],
      ),
    );
  }
}
