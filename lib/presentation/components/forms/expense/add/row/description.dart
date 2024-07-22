import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowInputDescription extends StatelessWidget {
  const RowInputDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      height: DimensionApplication.massive,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectZetaIcons.text(),
          const SizedBox(width: DimensionApplication.large),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(context: context).h2(
                text: R.strings.simpleDescription,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
