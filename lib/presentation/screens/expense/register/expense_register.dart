import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/keyboard/keyboard.dart';
import 'package:projectzeta/presentation/layouts/layout.dart';

class ExpenseRegister extends StatelessWidget {
  const ExpenseRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpenseBodyLayout(),
                    ExpenseFooterLayout(),
                  ],
                ),
              ),
            ),
            CalculatorKeyboard()
          ],
        ),
      ),
    );
  }
}
