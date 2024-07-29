import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class ExpenseBodyLayout extends StatelessWidget {
  const ExpenseBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: R.strings.registerExpenseTitle, isGoBack: true),
        const SizedBox(height: DimensionApplication.gigantic),
        const AddExpenseForm(),
      ],
    );
  }
}
