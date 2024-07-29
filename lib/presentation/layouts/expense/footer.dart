import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class ExpenseFooterLayout extends StatelessWidget {
  const ExpenseFooterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final reducer = Provider.of<FormExpenseReducer>(context);

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
