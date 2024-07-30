import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class LabelText extends StatelessWidget {
  final bool isSelectedOption;
  final bool showItems;
  final String selectedOptionText;
  final String label;

  const LabelText({
    super.key,
    required this.isSelectedOption,
    required this.showItems,
    required this.selectedOptionText,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    if (showItems) {
      return CustomText(context: context).h2(
        text: label,
        color: SurfaceColors.pureWhite,
      );
    } else if (isSelectedOption) {
      return CustomText(context: context).h2(
        text: selectedOptionText,
        color: PrimaryColors.deepPurple,
      );
    }

    return CustomText(context: context).h2(
      text: label,
      color: SurfaceColors.lightGray,
    );
  }
}
