import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/buttons/text_button_without_icon.dart';
import 'package:projectzeta/presentation/components/input/input.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:projectzeta/utils/utils.dart';

import '../../components/components.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widthWithPadding = width * 0.05;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthWithPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _renderHeader(context),
              _renderForm(context),
              _renderFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderForm(BuildContext context) {
    return Column(
      children: [
        InputWithIcon(
          prefixIcon: ProjectZetaIcons.mail(),
          label: R.strings.email,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: DimensionApplication.large),
        InputWithIcon(
          prefixIcon: ProjectZetaIcons.lock(),
          label: R.strings.password,
          keyboardType: TextInputType.visiblePassword,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            child: TextButtonWithoutIcon(
              child: CustomText(context: context).bodySmall(
                text: R.strings.forgotPassword,
                color: SurfaceColors.lightGray,
              ),
            ),
          ),
        ),
        Button(
          title: R.strings.enter,
          color: PrimaryColors.deepPurple,
        ),
      ],
    );
  }

  Widget _renderHeader(BuildContext context) {
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

  Widget _renderFooter(BuildContext context) {
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
