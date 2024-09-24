import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectzeta/presentation/components/keyboard/calculator/button.dart';
import 'package:projectzeta/presentation/components/keyboard/calculator/operations.dart';

class RowOne extends StatelessWidget {
  const RowOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.delete),
      ],
    );
  }
}

class RowTwo extends StatelessWidget {
  const RowTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCalculatorKeyboard(operation: CalculatorOperation.clear),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.parentheses),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.percentage),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.divide),
      ],
    );
  }
}

class RowThree extends StatelessWidget {
  const RowThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCalculatorKeyboard(operation: CalculatorOperation.seven),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.eight),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.nine),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.multiply),
      ],
    );
  }
}

class RowFour extends StatelessWidget {
  const RowFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCalculatorKeyboard(operation: CalculatorOperation.four),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.five),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.six),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.subtract),
      ],
    );
  }
}

class RowFive extends StatelessWidget {
  const RowFive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCalculatorKeyboard(operation: CalculatorOperation.one),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.two),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.three),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.add),
      ],
    );
  }
}

class RowSix extends StatelessWidget {
  const RowSix({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCalculatorKeyboard(operation: CalculatorOperation.invert),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.zero),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.decimal),
        ButtonCalculatorKeyboard(operation: CalculatorOperation.equals),
      ],
    );
  }
}
