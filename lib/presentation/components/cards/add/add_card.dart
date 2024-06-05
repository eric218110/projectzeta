import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:projectzeta/presentation/components/text/custom_text.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double height = deviceHeight * 0.19;
    double width = deviceWidth - (DimensionApplication.horizontalPadding * 2);
    double widthButton = width - (DimensionApplication.extraLarge * 2);

    return Padding(
      padding: const EdgeInsets.all(DimensionApplication.horizontalPadding + 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DimensionApplication.large),
        child: Container(
          color: SurfaceColors.lightGray,
          height: height,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.all(
                DimensionApplication.horizontalPadding * 2,
              ),
              width: widthButton,
              height: DimensionApplication.colossal,
              decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                  dashLength: 8,
                  side: BorderSide(color: SurfaceColors.charcoalGray, width: 2),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(context: context).h3(
                    text: 'Adicionar cartão',
                    color: SurfaceColors.nearWhite,
                  ),
                  const SizedBox(width: DimensionApplication.medium),
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: SurfaceColors.nearWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _loadButtonStyle() {
    return BoxDecoration(color: SurfaceColors.darkGray);
  }
}
