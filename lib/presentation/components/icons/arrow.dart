import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class IconArrows extends StatelessWidget {
  final bool show;
  final bool isPrimary;

  const IconArrows({
    super.key,
    required this.show,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    if (show) {
      return Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: ProjectZetaIcons.arrowUp(
            color: GradientColors.borderGray,
          ),
        ),
      );
    } else if (isPrimary) {
      return Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: ProjectZetaIcons.arrowDown(
            color: PrimaryColors.deepPurple,
          ),
        ),
      );
    }

    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: ProjectZetaIcons.arrowDown(color: GradientColors.borderGray),
      ),
    );
  }
}
