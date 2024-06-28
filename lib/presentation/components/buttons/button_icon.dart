import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class ButtonIcon extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;

  const ButtonIcon({
    super.key,
    required this.child,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _defaultStyle(),
      onPressed: () {},
      child: SizedBox(child: child),
    );
  }

  ButtonStyle _defaultStyle() {
    return TextButton.styleFrom(
      foregroundColor: SurfaceColors.lightGray,
      backgroundColor: color ?? SurfaceColors.pureBlack,
      minimumSize: const Size(0, 0),
      shape: BorderRadiusApplication.sm,
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.bigLarge,
        vertical: DimensionApplication.medium,
      ),
    );
  }
}
