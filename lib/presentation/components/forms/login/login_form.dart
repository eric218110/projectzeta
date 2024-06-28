import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/components/buttons/text_button_without_icon.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/components/input/input.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
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
}
