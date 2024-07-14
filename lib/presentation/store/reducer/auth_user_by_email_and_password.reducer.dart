import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/use_cases/auth/auth_by_email_and_password.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/auth_user_by_email_and_password.state.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

class AuthUserByEmailAndPassword extends ChangeNotifier {
  final AuthByEmailAndPassword _authByEmailAndPassword =
      getIt<AuthByEmailAndPassword>();

  final OnSaveOnboarding _onSaveOnboarding = getIt<OnSaveOnboarding>();
  final OnSaveUserInStorage _onSaveUserInStorage = getIt<OnSaveUserInStorage>();

  AuthUserByEmailAndPasswordState state =
      AuthUserByEmailAndPasswordStateEmpty();

  Future<AuthUserByEmailAndPasswordState> onAuthUserByEmailAndPassword(
      EmailAndPassword emailAndPassword) async {
    try {
      state = AuthUserByEmailAndPasswordStateLoading();

      notifyListeners();

      var response = await _authByEmailAndPassword.onAuth(emailAndPassword);

      state = AuthUserByEmailAndPasswordStateSuccess(result: response);

      await _onSaveOnboarding.save(state.result);
      await _onSaveUserInStorage.save(response);
      notifyListeners();

      Routefly.navigate(routePaths.home);
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
