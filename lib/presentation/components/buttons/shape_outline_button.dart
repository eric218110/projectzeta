import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/text/custom_text.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class ShapeOutlineButton extends StatelessWidget {
  final String title;
  final Widget iconLeft;
  final Color color;
  final ButtonStyle? style;

  const ShapeOutlineButton({
    super.key,
    required this.title,
    required this.iconLeft,
    this.color = Colors.transparent,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: style ?? _defaultStyle(),
      onPressed: () {},
      child: Row(
        children: [
          iconLeft,
          const SizedBox(width: DimensionApplication.medium),
          CustomText(context: context).h3(
            text: title,
          )
        ],
      ),
    );
  }

  ButtonStyle _defaultStyle() {
    return TextButton.styleFrom(
      foregroundColor: Colors.transparent,
      backgroundColor: GradientColors.translucentGray,
      minimumSize: const Size(100, 50),
      shape: BorderRadiusApplication.md,
      padding: const EdgeInsets.symmetric(
        vertical: DimensionApplication.mediumLarge,
        horizontal: DimensionApplication.extraLarge,
      ),
    );
  }
}
