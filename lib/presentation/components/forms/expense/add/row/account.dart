import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/utils/utils.dart';

class RowAccount extends StatelessWidget {
  const RowAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Select(
      icon: ProjectZetaIcons.walletOutline(
        color: SurfaceColors.pureWhite,
      ),
      label: R.strings.account,
    );
  }
}
