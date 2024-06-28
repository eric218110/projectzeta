import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButtonWithoutIcon(
            child: CustomText(context: context).bodySmall(
              text: R.strings.createAccount,
              color: SurfaceColors.lightGray,
            ),
          ),
        ),
        const SizedBox(height: DimensionApplication.base),
        Align(
          alignment: Alignment.center,
          child: CustomText(context: context).bodySmall(
            text: R.strings.orContinueWith,
            color: SurfaceColors.lightGray,
          ),
        ),
        const SizedBox(height: DimensionApplication.base),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonIcon(
              child: ProjectZetaIcons.google(),
            ),
            const SizedBox(width: DimensionApplication.medium),
            ButtonIcon(
              child: ProjectZetaIcons.facebook(),
            ),
            const SizedBox(width: DimensionApplication.medium),
            ButtonIcon(
              child: ProjectZetaIcons.apple(),
            )
          ],
        ),
      ],
    );
  }
}
