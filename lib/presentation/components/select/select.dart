import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Select extends StatelessWidget {
  final Widget icon;
  final String label;

  const Select({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DimensionApplication.base,
        ),
        height: DimensionApplication.huge,
        decoration: BoxDecoration(
          border: Border.all(
            color: GradientColors.borderGray,
            width: 0.5,
          ),
          borderRadius: BorderRadiusApplication.tiny.borderRadius,
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: DimensionApplication.large,
            ),
            CustomText(context: context).h2(
              text: label,
              color: SurfaceColors.lightGray,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ProjectZetaIcons.arrowDown(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
