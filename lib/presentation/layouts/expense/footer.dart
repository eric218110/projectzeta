import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class ExpenseFooterLayout extends StatelessWidget {
  const ExpenseFooterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final reducer = getIt<FormExpenseStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.horizontalPadding,
        vertical: DimensionApplication.colossal,
      ),
      child: Button(
        color: AccentColors.boldRed,
        title: R.strings.addExpense,
        onPressed: reducer.handlerOnPressAddExpense,
      ),
    );
  }
}
