import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/text/custom_text.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Button extends StatelessWidget {
  final String title;
  final Color? color;
  final ButtonStyle? style;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: style ?? _defaultStyle(),
      onPressed: onPressed,
      child: Center(
        child: CustomText(context: context).h3(
          text: title,
        ),
      ),
    );
  }

  ButtonStyle _defaultStyle() {
    return TextButton.styleFrom(
      foregroundColor: Colors.transparent,
      backgroundColor: color ?? GradientColors.translucentGray,
      minimumSize: const Size(100, 50),
      shape: BorderRadiusApplication.sm,
      padding: const EdgeInsets.symmetric(
        vertical: DimensionApplication.mediumLarge,
        horizontal: DimensionApplication.extraLarge,
      ),
    );
  }
}
