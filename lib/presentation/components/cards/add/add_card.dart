import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        DimensionApplication.horizontalPadding + 1,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DimensionApplication.large),
        child: Align(
          alignment: Alignment.topCenter,
          child: _renderButton(context),
        ),
      ),
    );
  }

  _renderButton(BuildContext context) {
    var dimensions = _loadDimension(context);
    double widthButton =
        dimensions['width']! - (DimensionApplication.extraLarge * 2);

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
        onTap: () {},
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(context: context).h3(
                  text: R.strings.addCard,
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




// Container(
//       margin: const EdgeInsets.all(
//         DimensionApplication.horizontalPadding,
//       ),
//       width: widthButton,
//       height: DimensionApplication.colossal,
//       decoration: BoxDecoration(
//         border: DashedBorder.fromBorderSide(
//           dashLength: DimensionApplication.base,
//           side: BorderSide(
//             color: SurfaceColors.charcoalGray,
//             width: DimensionApplication.tiny,
//           ),
//         ),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(
//             DimensionApplication.base,
//           ),
//         ),
//       ),
//       child: Ink(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomText(context: context).h3(
//               text: R.strings.addCard,
//               color: SurfaceColors.nearWhite,
//             ),
//             const SizedBox(width: DimensionApplication.medium),
//             Icon(
//               Icons.add_circle_outline_rounded,
//               color: SurfaceColors.nearWhite,
//             ),
//           ],
//         ),
//       ),
//     )