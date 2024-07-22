import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowExpenseData extends StatelessWidget {
  const RowExpenseData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      height: DimensionApplication.massive,
      child: Row(
        children: [
          ProjectZetaIcons.calendarClearOutline(),
          const SizedBox(width: DimensionApplication.large),
          CustomText(context: context).h2(
            text: R.strings.expenseDate,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ProjectZetaIcons.arrowRight(),
            ),
          ),
        ],
      ),
    );
  }
}
