import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/store/store.dart';
import 'package:projectzeta/routes.g.dart';
import 'package:routefly/routefly.dart';

class AuthUserStore extends ValueNotifier<AuthUserByEmailAndPasswordState> {
  final AuthByEmailAndPassword _authByEmailAndPassword;
  final OnSaveOnboarding _onSaveOnboarding;
  final UserStore _userReducer;

  AuthUserStore(
    this._authByEmailAndPassword,
    this._onSaveOnboarding,
    this._userReducer,
  ) : super(AuthUserByEmailAndPasswordStateEmpty());

  bool get isLoading => value.isLoading;
  UserModel get currentUserAuthenticated => value.result;

  Future<AuthUserByEmailAndPasswordState> onAuthUserByEmailAndPassword(
    EmailAndPassword emailAndPassword,
  ) async {
    try {
      value = AuthUserByEmailAndPasswordStateLoading();

      var response = await _authByEmailAndPassword.onAuth(emailAndPassword);

      value = AuthUserByEmailAndPasswordStateSuccess(result: response);

      await _onSaveOnboarding.save(value.result);
      await _userReducer.saveUser(response);

      Routefly.navigate(routePaths.home);
      return value;
    } catch (e) {
      value = AuthUserByEmailAndPasswordStateError(
        error: ApplicationError(message: 'Not possible auth user'),
      );

      return value;
    }
  }
}
