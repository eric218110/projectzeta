import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/text/custom_text.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class Button extends StatelessWidget {
  final String title;
  final Color? color;
  final bool? isLoading;
  final ButtonStyle? style;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.style,
    this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    var loading = isLoading ?? false;

    return AnimatedContainer(
      duration: const Duration(microseconds: 800),
      width: loading ? DimensionApplication.gigantic : null,
      height: loading ? DimensionApplication.gigantic : null,
      child: TextButton(
        style: style ?? _defaultStyle(loading),
        onPressed: loading ? () {} : onPressed,
        child: AnimatedCrossFade(
          crossFadeState: isLoading ?? false
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(microseconds: 800),
          firstChild: Center(
            child: CustomText(context: context).h3(
              text: title,
            ),
          ),
          secondChild: SizedBox(
            height: DimensionApplication.extraExtraExtraLarge,
            width: DimensionApplication.extraExtraExtraLarge,
            child: Padding(
              padding: const EdgeInsets.all(DimensionApplication.tiny),
              child: CircularProgressIndicator(
                color: SurfaceColors.pureWhite,
                strokeCap: StrokeCap.round,
                strokeWidth: DimensionApplication.tiny,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _defaultStyle(bool isLoading) {
    return TextButton.styleFrom(
      foregroundColor: Colors.transparent,
      backgroundColor: color ?? GradientColors.translucentGray,
      minimumSize: const Size(100, 50),
      shape: isLoading
          ? BorderRadiusApplication.circular
          : BorderRadiusApplication.sm,
      padding: EdgeInsets.symmetric(
        vertical: isLoading ? 0 : DimensionApplication.mediumLarge,
        horizontal: isLoading ? 0 : DimensionApplication.extraLarge,
      ),
    );
  }
}
