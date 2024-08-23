import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/form_expense/store.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowButtonDetails extends StatelessWidget {
  const RowButtonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final store = getIt<FormExpenseStore>();

    return ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, __) {
          return GestureDetector(
            onTap: store.handlerOnToggleDetails,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: DimensionApplication.mediumTiny,
                horizontal: DimensionApplication.base,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(context: context).h1(
                    text: R.strings.details,
                    color: SurfaceColors.charcoalGray,
                  ),
                  const SizedBox(width: DimensionApplication.base),
                  state.showDetails
                      ? ProjectZetaIcons.arrowUp(
                          color: SurfaceColors.charcoalGray,
                        )
                      : ProjectZetaIcons.arrowDown(
                          color: SurfaceColors.charcoalGray,
                        )
                ],
              ),
            ),
          );
        });
  }
}
