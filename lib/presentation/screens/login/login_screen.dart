import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/input/input.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widthWithPadding = width * 0.05;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            const OverlayOnboarding(),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthWithPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      InputWithIcon(
                        prefixIcon: ProjectZetaIcons.mail(),
                        label: R.strings.email,
                      ),
                      const SizedBox(height: DimensionApplication.large),
                      InputWithIcon(
                        prefixIcon: ProjectZetaIcons.lock(),
                        label: R.strings.password,
                      ),
                      const SizedBox(height: DimensionApplication.large),
                      SizedBox(
                        width: double.infinity,
                        child: CustomText(context: context).bodySmall(
                          text: R.strings.forgotPassword,
                          color: SurfaceColors.charcoalGray,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(height: DimensionApplication.large),
                      Button(
                        title: R.strings.enter,
                        color: PrimaryColors.deepPurple,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
