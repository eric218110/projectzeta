import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class ShowCardTitle extends StatelessWidget {
  const ShowCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.horizontalPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(context: context).bodySmall(
            text: R.strings.cards,
            color: SurfaceColors.lightGray,
          ),
          TextButtonWithIcon(
            iconRight: ProjectZetaIcons.arrowRight(),
            child: CustomText(context: context).bodySmall(
              text: R.strings.viewAll,
              color: SurfaceColors.lightGray,
            ),
          )
        ],
      ),
    );
  }
}
