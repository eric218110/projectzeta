import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowCategoryExpense extends StatefulWidget {
  const RowCategoryExpense({super.key});

  @override
  State<RowCategoryExpense> createState() => _RowCategoryExpenseState();
}

class _RowCategoryExpenseState extends State<RowCategoryExpense> {
  final key = GlobalKey<SelectState>();
  late FormExpenseReducer reducer;
  bool isSelectedOption = false;

  void _handlerOnPressOption(ItemsKeyValue option) {
    if (key.currentState != null) {
      key.currentState!.handlerOnPressItem(option.value);
      reducer.handlerOnPressCategoryOption(option);
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reducer = Provider.of<FormExpenseReducer>(context, listen: false);
    });
    super.initState();
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
