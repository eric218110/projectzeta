import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowButtonRepeat extends StatelessWidget {
  const RowButtonRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      height: DimensionApplication.massive,
      child: Row(
        children: [
          ProjectZetaIcons.repeatOutline(color: SurfaceColors.lightGray),
          const SizedBox(width: DimensionApplication.large),
          ButtonSmallText(
            text: R.strings.wage,
            textColor: SurfaceColors.lightGray,
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
