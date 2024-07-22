import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';

class ExpenseValue extends StatelessWidget {
  const ExpenseValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(context: context).h2(
          text: R.strings.expenseValue,
          color: SurfaceColors.lighterGray,
        ),
        CustomText(context: context).h6(
          text: R.strings.yourBalance,
          color: SurfaceColors.pureWhite,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
