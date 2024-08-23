import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/account/store.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';

class RowAccount extends StatefulWidget {
  const RowAccount({super.key});

  @override
  State<RowAccount> createState() => _RowAccountState();
}

class _RowAccountState extends State<RowAccount> {
  final key = GlobalKey<SelectState>();
  final FormExpenseStore store = getIt<FormExpenseStore>();
  final accountStore = getIt<AccountStore>();
  bool isSelectedOption = false;

  void _handlerOnPressOption(ItemsKeyValue option) {
    if (key.currentState != null) {
      key.currentState!.handlerOnPressItem(option.value);
      store.handlerOnPressAccountOption(option);
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
    return Select(
      key: key,
      onPress: _handlerOnPressSelect,
      icon: ProjectZetaIcons.walletOutline(
        color: isSelectedOption
            ? PrimaryColors.deepPurple
            : SurfaceColors.pureWhite,
      ),
      label: R.strings.account,
      child: ValueListenableBuilder(
          valueListenable: accountStore,
          builder: (_, s, __) {
            return OptionsItemList(
              items: s.accounts
                  .map((account) => ItemsKeyValue(
                      key: account.id, value: account.description))
                  .toList(),
              onPress: _handlerOnPressOption,
            );
          }),
    );
  }
}
