import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:projectzeta/utils/utils.dart';
import 'package:routefly/routefly.dart';

class ShowCardTitle extends StatelessWidget {
  const ShowCardTitle({super.key});

  void _handlerOnPressViewAllButton() {
    Routefly.push(routePaths.creditCard.viewAll);
  }

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
            onTap: _handlerOnPressViewAllButton,
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
