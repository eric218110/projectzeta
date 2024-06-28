import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/text/text.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(context: context).h6(
          text: R.strings.enterInYourAccount,
          color: PrimaryColors.deepPurple,
        ),
        const SizedBox(height: DimensionApplication.base),
        CustomText(context: context).h4(
          text: R.strings.textDescriptionInLogin,
          color: SurfaceColors.lightGray,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: DimensionApplication.bigGigantic),
      ],
    );
  }
}
