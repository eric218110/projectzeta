import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class ButtonSmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;

  const ButtonSmallText({
    super.key,
    required this.text,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {},
        style: _defaultStyle(color),
        child: CustomText(context: context).h1(
          text: text,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  ButtonStyle _defaultStyle(Color? color) {
    return TextButton.styleFrom(
      foregroundColor: color,
      backgroundColor: GradientColors.translucentGray,
      minimumSize: const Size(
        DimensionApplication.immenseGigantic,
        DimensionApplication.extraExtraLarge,
      ),
      shape: BorderRadiusApplication.sm,
      side: BorderSide(
        color: color ?? Colors.transparent,
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.medium,
        vertical: DimensionApplication.extraSmall,
      ),
    );
  }
}
