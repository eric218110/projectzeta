import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:provider/provider.dart';

class RowAccount extends StatefulWidget {
  const RowAccount({super.key});

  @override
  State<RowAccount> createState() => _RowAccountState();
}

class _RowAccountState extends State<RowAccount> {
  final key = GlobalKey<SelectState>();
  late FormExpenseReducer reducer;
  bool isSelectedOption = false;

  void _handlerOnPressOption(ItemsKeyValue option) {
    if (key.currentState != null) {
      key.currentState!.handlerOnPressItem(option.value);
      reducer.handlerOnPressAccountOption(option);
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
    return Select(
      key: key,
      onPress: _handlerOnPressSelect,
      icon: ProjectZetaIcons.walletOutline(
        color: isSelectedOption
            ? PrimaryColors.deepPurple
            : SurfaceColors.pureWhite,
      ),
      label: R.strings.account,
      child: OptionsItemList(
        items: [
          ItemsKeyValue(key: 'test_account', value: 'Test Account'),
        ],
        onPress: _handlerOnPressOption,
      ),
    );
  }
}
