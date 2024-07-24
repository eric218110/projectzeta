import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/expense_value.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/row.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

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
            AddExpenseCard(
              title: R.strings.expenseTitle,
              child: const Form(
                child: Column(
                  children: [
                    RowInputDescription(),
                    RowExpenseData(),
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
