import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentation/components/components.dart';
import 'package:projectzeta/src/presentation/theme/theme.dart';

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
            text: 'Cartões',
            color: SurfaceColors.lightGray,
          ),
          TextButtonWithIcon(
            iconRight: ProjectZetaIcons.arrowRight(),
            child: CustomText(context: context).bodySmall(
              text: 'Ver todos',
              color: SurfaceColors.lightGray,
            ),
          )
        ],
      ),
    );
  }
}
