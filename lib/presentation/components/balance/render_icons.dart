import 'package:flutter/material.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/show_your_balance/store.dart';
import 'package:projectzeta/presentation/theme/colors.dart';

class RenderIcons extends StatelessWidget {
  const RenderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final reducer = getIt<ShowYourBalanceStore>();

    return ValueListenableBuilder(
        valueListenable: reducer,
        builder: (context, state, child) {
          if (!state.isShowYourBalance) {
            return IconButton(
              onPressed: reducer.toggleYourBalance,
              icon: ProjectZetaIcons.eyeOffOutline(
                color: SurfaceColors.lightGray,
              ),
            );
          }

          return IconButton(
            onPressed: reducer.toggleYourBalance,
            icon: ProjectZetaIcons.eyeOutline(
              color: SurfaceColors.lightGray,
            ),
          );
        });
  }
}
