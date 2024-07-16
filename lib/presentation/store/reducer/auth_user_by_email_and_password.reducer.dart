import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/use_cases/auth/auth_by_email_and_password.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/auth_user_by_email_and_password.state.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

class AuthUserByEmailAndPassword extends ChangeNotifier {
  final AuthByEmailAndPassword authByEmailAndPassword;
  final OnSaveOnboarding onSaveOnboarding;
  final OnSaveUserInStorage onSaveUserInStorage;

  AuthUserByEmailAndPasswordState _state =
      AuthUserByEmailAndPasswordStateEmpty();

  AuthUserByEmailAndPassword({
    required this.authByEmailAndPassword,
    required this.onSaveOnboarding,
    required this.onSaveUserInStorage,
  });

  bool get isLoading => _state.isLoading;
  UserModel get currentUserAuthenticated => _state.result;

  Future<AuthUserByEmailAndPasswordState> onAuthUserByEmailAndPassword(
      EmailAndPassword emailAndPassword) async {
    try {
      _state = AuthUserByEmailAndPasswordStateLoading();

      notifyListeners();

      var response = await authByEmailAndPassword.onAuth(emailAndPassword);

      _state = AuthUserByEmailAndPasswordStateSuccess(result: response);

      await onSaveOnboarding.save(_state.result);
      await onSaveUserInStorage.save(response);
      notifyListeners();

      Routefly.navigate(routePaths.home);
      return _state;
    } catch (e) {
      _state = AuthUserByEmailAndPasswordStateError(
        error: ApplicationError(message: 'Not possible auth user'),
      );

      notifyListeners();
      return _state;
    }
  }

  factory AuthUserByEmailAndPassword.create() {
    var authByEmailAndPassword = getIt<AuthByEmailAndPassword>();
    var onSaveOnboarding = getIt<OnSaveOnboarding>();
    var onSaveUserInStorage = getIt<OnSaveUserInStorage>();

    return AuthUserByEmailAndPassword(
      authByEmailAndPassword: authByEmailAndPassword,
      onSaveOnboarding: onSaveOnboarding,
      onSaveUserInStorage: onSaveUserInStorage,
    );
  }
}
