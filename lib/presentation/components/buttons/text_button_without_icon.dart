import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class TextButtonWithoutIcon extends StatelessWidget {
  final Widget child;
  final ButtonStyle? style;
  final VoidCallback? onTap;
  final Color? color;

  const TextButtonWithoutIcon({
    super.key,
    required this.child,
    this.style,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: style ?? _defaultStyle(),
      onPressed: () {},
      child: SizedBox(child: child),
    );
  }

  ButtonStyle _defaultStyle() {
    return TextButton.styleFrom(
      foregroundColor: GradientColors.translucentGray,
      backgroundColor: color ?? GradientColors.transparent,
      minimumSize: const Size(0, 0),
      shape: BorderRadiusApplication.sm,
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.base,
        vertical: DimensionApplication.base,
      ),
    );
  }
}
