import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class AddExpenseCard extends StatelessWidget {
  final Widget child;
  final String title;

  const AddExpenseCard({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(context: context).bodySmall(
          text: title,
          color: SurfaceColors.lightGray,
        ),
        const SizedBox(
          height: DimensionApplication.base,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: DimensionApplication.large,
          ),
          decoration: BoxDecoration(
            color: GradientColors.translucentGray,
            border: Border.all(
              color: GradientColors.borderGray,
              width: 0.5,
            ),
            borderRadius: BorderRadiusApplication.md.borderRadius,
          ),
          child: child,
        ),
      ],
    );
  }
}
