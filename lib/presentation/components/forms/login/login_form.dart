import 'package:flutter/material.dart';
import 'package:projectzeta/domain/model/forms/forms.dart';
import 'package:projectzeta/domain/validator/email/email_validator.dart';
import 'package:projectzeta/domain/validator/validator.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
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
  final reducer = AuthUserByEmailAndPassword();

  final formKey = GlobalKey<FormState>();
  FormState get form => formKey.currentState!;

  late EmailAndPassword emailAndPassword;

  @override
  void initState() {
    super.initState();
    reducer.addListener(_listener);
    emailAndPassword = EmailAndPassword.empty(emailValidator);
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    reducer.removeListener(_listener);
    super.dispose();
  }

  void _handlerOnPressSubmitButton() async {
    if (form.validate()) {
      await reducer.onAuthUserByEmailAndPassword(emailAndPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: CustomText(context: context).bodySmall(
                  text: R.strings.forgotPassword,
                  color: SurfaceColors.lightGray,
                ),
              ),
            ),
          ),
          Button(
            isLoading: reducer.state.isLoading,
            onPressed: _handlerOnPressSubmitButton,
            title: R.strings.enter,
            color: PrimaryColors.deepPurple,
          ),
        ],
      ),
    );
  }
}
