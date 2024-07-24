import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class ExpenseRegister extends StatelessWidget {
  const ExpenseRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: R.strings.registerExpenseTitle, isGoBack: true),
                const SizedBox(height: DimensionApplication.gigantic),
                const AddExpenseForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
