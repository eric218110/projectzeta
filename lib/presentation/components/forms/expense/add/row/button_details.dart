import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class ButtonDetails extends StatelessWidget {
  final Function()? onTap;
  final bool showDetail;

  const ButtonDetails({
    super.key,
    required this.onTap,
    required this.showDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: DimensionApplication.mediumTiny,
          horizontal: DimensionApplication.base,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(context: context).h1(
              text: R.strings.details,
              color: SurfaceColors.lightGray,
            ),
            const SizedBox(width: DimensionApplication.base),
            showDetail
                ? ProjectZetaIcons.arrowUp(
                    color: SurfaceColors.lightGray,
                  )
                : ProjectZetaIcons.arrowDown(
                    color: SurfaceColors.lightGray,
                  )
          ],
        ),
      ),
    );
  }
}
