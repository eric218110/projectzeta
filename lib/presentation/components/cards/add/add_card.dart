import 'package:flutter/material.dart';
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
          child: ButtonWithInkwell(
            text: R.strings.addCard,
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: SurfaceColors.nearWhite,
            ),
          ),
        ),
      ),
    );
  }
}
