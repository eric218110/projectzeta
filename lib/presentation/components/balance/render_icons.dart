import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/show_your_balance.reducer.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:provider/provider.dart';

class RenderIcons extends StatelessWidget {
  const RenderIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowYourBalanceReducer>(builder: (context, state, child) {
      if (state.isShowYourBalance) {
        return IconButton(
          onPressed: state.toggleYourBalance,
          icon: ProjectZetaIcons.eyeOffOutline(
            color: SurfaceColors.lightGray,
          ),
        );
      }

      return IconButton(
        onPressed: state.toggleYourBalance,
        icon: ProjectZetaIcons.eyeOutline(
          color: SurfaceColors.lightGray,
        ),
      );
    });
  }
}
