import 'package:flutter/material.dart';
import 'package:projectzeta/domain/model/forms/forms.dart';
import 'package:projectzeta/domain/validator/email/email_validator.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/store.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final EmailValidator emailValidator = getIt<EmailValidator>();

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  late EmailAndPassword emailAndPassword = EmailAndPassword.empty(
    emailValidator,
  );

  void _handlerOnPressSubmitButton(
    Future<AuthUserByEmailAndPasswordState> Function(
      EmailAndPassword emailAndPassword,
    ) onAuthUserByEmailAndPassword,
  ) async {
    if (form.validate()) {
      await onAuthUserByEmailAndPassword(emailAndPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    final reducer = getIt<AuthUserStore>();

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          InputWithIcon(
            label: R.strings.email,
            value: emailAndPassword.email.toString(),
            validator: (v) => emailAndPassword.email.validator(v),
            onChanged: emailAndPassword.setEmail,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: ProjectZetaIcons.mail(),
          ),
          const SizedBox(height: DimensionApplication.large),
          InputWithIcon(
            label: R.strings.password,
            value: emailAndPassword.password.toString(),
            validator: (v) => emailAndPassword.password.validator(v),
            onChanged: emailAndPassword.setPassword,
            prefixIcon: ProjectZetaIcons.lock(),
            keyboardType: TextInputType.visiblePassword,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: TextButtonWithoutIcon(
                child: CustomText(context: context).h1(
                  text: R.strings.forgotPassword,
                  color: SurfaceColors.lightGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Button(
            isLoading: reducer.isLoading,
            onPressed: () => _handlerOnPressSubmitButton(
              reducer.onAuthUserByEmailAndPassword,
            ),
            title: R.strings.enter,
            color: PrimaryColors.deepPurple,
          ),
        ],
      ),
    );
  }
}
