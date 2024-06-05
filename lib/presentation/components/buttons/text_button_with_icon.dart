import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class TextButtonWithIcon extends StatelessWidget {
  final Widget iconRight;
  final Widget child;
  final BoxDecoration? style;
  final VoidCallback? onTap;

  const TextButtonWithIcon({
    super.key,
    required this.iconRight,
    required this.child,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: style ?? _defaultDecoration(),
        // Adicionando padding para melhorar a área de toque
        child: Row(
          children: [
            child,
            const SizedBox(width: DimensionApplication.medium),
            iconRight,
          ],
        ),
      ),
    );
  }

  BoxDecoration _defaultDecoration() {
    return const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.all(
        Radius.circular(DimensionApplication.base),
      ),
    );
  }
}
