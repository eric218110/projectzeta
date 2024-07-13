import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/use_cases/auth/auth_by_email_and_password.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/auth_user_by_email_and_password.state.dart';

class AuthUserByEmailAndPassword extends ChangeNotifier {
  final AuthByEmailAndPassword _authByEmailAndPassword =
      getIt<AuthByEmailAndPassword>();

  AuthUserByEmailAndPasswordState state =
      AuthUserByEmailAndPasswordStateEmpty();

  Future<AuthUserByEmailAndPasswordState> onAuthUserByEmailAndPassword(
      EmailAndPassword emailAndPassword) async {
    try {
      state = AuthUserByEmailAndPasswordStateLoading();

      notifyListeners();

      var response = await _authByEmailAndPassword.onAuth(emailAndPassword);

      state = AuthUserByEmailAndPasswordStateSuccess(result: response);
      notifyListeners();
      return state;
    } catch (e) {
      state = AuthUserByEmailAndPasswordStateError(
        error: ApplicationError(message: 'Not possible auth user'),
      );

      notifyListeners();
      return state;
    }
  }
}
