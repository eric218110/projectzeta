import 'package:projectzeta/domain/domain.dart';

sealed class AuthUserByEmailAndPasswordState {
  final bool isLoading;
  final ApplicationError error;
  final UserModel result;

  AuthUserByEmailAndPasswordState({
    required this.isLoading,
    required this.error,
    required this.result,
  });
}

class AuthUserByEmailAndPasswordStateSuccess
    implements AuthUserByEmailAndPasswordState {
  @override
  final UserModel result;

  @override
  ApplicationError get error => ApplicationError.empty();

  AuthUserByEmailAndPasswordStateSuccess({
    required this.result,
  });

  @override
  bool get isLoading => false;
}

class AuthUserByEmailAndPasswordStateError
    implements AuthUserByEmailAndPasswordState {
  @override
  bool get isLoading => false;

  @override
  final ApplicationError error;

  @override
  UserModel get result => UserModelIsEmpty();

  AuthUserByEmailAndPasswordStateError({required this.error});
}

class AuthUserByEmailAndPasswordStateLoading
    implements AuthUserByEmailAndPasswordState {
  @override
  ApplicationError get error => ApplicationError.empty();

  @override
  UserModel get result => UserModelIsEmpty();

  @override
  bool get isLoading => true;
}

class AuthUserByEmailAndPasswordStateEmpty
    implements AuthUserByEmailAndPasswordState {
  @override
  ApplicationError get error => ApplicationError.empty();

  @override
  UserModel get result => UserModelIsEmpty();

  @override
  bool get isLoading => false;
}
