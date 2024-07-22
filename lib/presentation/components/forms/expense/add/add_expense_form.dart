import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/expense_value.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/row.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class AddExpenseForm extends StatelessWidget {
  const AddExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionApplication.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExpenseValue(),
            const SizedBox(height: DimensionApplication.large),
            Card(
              color: GradientColors.translucentGray,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: DimensionApplication.small,
                ),
                child: const Column(
                  children: [
                    RowExpenseData(),
                    RowInputDescription(),
                    RowButtonExpense(),
                    RowButtonInWallet(),
                    RowButtonRepeat(),
                    RowButtonObservation(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
