import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';

class RowAccount extends StatelessWidget {
  const RowAccount({super.key});

  void _handlerOnPressOption(ItemsKeyValue option) {}

  @override
  Widget build(BuildContext context) {
    return Select(
      onPressOption: _handlerOnPressOption,
      icon: ProjectZetaIcons.walletOutline(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.account,
    );
  }
}
