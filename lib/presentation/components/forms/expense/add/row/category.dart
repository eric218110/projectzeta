import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowCategoryExpense extends StatelessWidget {
  const RowCategoryExpense({super.key});

  void _handlerOnPressOption(ItemsKeyValue option) {}

  @override
  Widget build(BuildContext context) {
    final reducer = Provider.of<FormExpenseReducer>(context);

    return Select<ItemsKeyValue>(
      onPressOption: _handlerOnPressOption,
      icon: ProjectZetaIcons.moneySend(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.category,
    );
  }
}
