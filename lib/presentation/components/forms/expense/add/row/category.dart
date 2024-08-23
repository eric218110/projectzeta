import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class RowCategoryExpense extends StatefulWidget {
  const RowCategoryExpense({super.key});

  @override
  State<RowCategoryExpense> createState() => _RowCategoryExpenseState();
}

class _RowCategoryExpenseState extends State<RowCategoryExpense> {
  final key = GlobalKey<SelectState>();
  final store = getIt<FormExpenseStore>();
  bool isSelectedOption = false;

  void _handlerOnPressOption(ItemsKeyValue option) {
    if (key.currentState != null) {
      key.currentState!.handlerOnPressItem(option.value);
      store.handlerOnPressCategoryOption(option);
      setState(() {
        isSelectedOption = true;
      });
    }
  }

  void _handlerOnPressSelect() {
    setState(() {
      isSelectedOption = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Select<ItemsKeyValue>(
      key: key,
      icon: ProjectZetaIcons.moneySend(
        color: isSelectedOption
            ? PrimaryColors.deepPurple
            : SurfaceColors.pureWhite,
      ),
      onPress: _handlerOnPressSelect,
      label: R.strings.category,
      child: OptionsItemList(
        items: [
          ItemsKeyValue(key: 'test', value: 'Test'),
        ],
        onPress: _handlerOnPressOption,
      ),
    );
  }
}
