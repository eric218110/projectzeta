import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowButtonInWallet extends StatelessWidget {
  const RowButtonInWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      height: DimensionApplication.massive,
      child: Row(
        children: [
          ProjectZetaIcons.walletOutline(color: PrimaryColors.deepPurple),
          const SizedBox(width: DimensionApplication.large),
          ButtonSmallText(
            text: R.strings.valueInWallet,
            color: PrimaryColors.deepPurple,
            textColor: PrimaryColors.lightPurple,
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
