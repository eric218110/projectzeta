import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/expense_value.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/button_details.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/row.dart';
import 'package:projectzeta/presentation/components/forms/expense/add/row/show_details.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  handlerOnPress(Function handlerOnPress) {
    if (form.validate()) {
      handlerOnPress();
    }
  }

  @override
  Widget build(BuildContext context) {
    final reducer = Provider.of<FormExpenseReducer>(context);
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: height - height * 0.3,
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionApplication.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExpenseValue(),
                const SizedBox(height: DimensionApplication.large),
                AddExpenseCard(
                  title: R.strings.expenseTitle,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: const Column(
                      children: [
                        RowInputDescription(),
                        SizedBox(height: DimensionApplication.base),
                        RowCategoryExpense(),
                        SizedBox(height: DimensionApplication.base),
                        RowAccount(),
                        RowShowDetails(),
                        SizedBox(height: DimensionApplication.base),
                        RowExpenseData(),
                        RowButtonDetails(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Button(
              color: AccentColors.boldRed,
              title: R.strings.addExpense,
              onPressed: () => handlerOnPress(reducer.handlerOnPressAddExpense),
            )
          ],
        ),
      ),
    );
  }
}
