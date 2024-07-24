import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';

class ButtonWithInkwell extends StatelessWidget {
  final String text;
  final Widget icon;
  final void Function()? onPressed;

  const ButtonWithInkwell({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var width = _loadDimension(context)['width'];
    double widthButton = width! - (DimensionApplication.extraLarge * 2);

    return Container(
      margin: const EdgeInsets.all(DimensionApplication.horizontalPadding),
      width: widthButton,
      height: DimensionApplication.colossal,
      decoration: BoxDecoration(
        border: DashedBorder.fromBorderSide(
          dashLength: DimensionApplication.base,
          side: BorderSide(
            color: SurfaceColors.charcoalGray,
            width: DimensionApplication.tiny,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            DimensionApplication.base,
          ),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(context: context).h3(
                  text: text,
                  color: SurfaceColors.nearWhite,
                ),
                const SizedBox(width: DimensionApplication.medium),
                icon
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, double> _loadDimension(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double height = deviceHeight * 0.19;
    double width = deviceWidth - (DimensionApplication.horizontalPadding * 2);

    return {
      'height': height,
      'width': width,
    };
  }
}
