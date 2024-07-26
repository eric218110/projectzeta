import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class PillsButton extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final bool? isActive;

  const PillsButton({
    super.key,
    required this.text,
    required this.onPress,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _defaultStyle(
        isActive! ? PrimaryColors.deepPurple : SurfaceColors.lightGray,
      ),
      onPressed: onPress,
      child: CustomText(context: context).h1(text: text),
    );
  }

  ButtonStyle _defaultStyle(Color? color) {
    return TextButton.styleFrom(
      foregroundColor: SurfaceColors.darkSurface,
      backgroundColor: color,
      minimumSize: const Size(0, DimensionApplication.extraLarge),
      shape: BorderRadiusApplication.lg,
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.medium,
        vertical: DimensionApplication.tiny,
      ),
    );
  }
}
