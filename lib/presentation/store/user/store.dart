import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/store/store.dart';

class UserStore extends ValueNotifier<UserState> {
  final OnSaveUserInStorage _onSaveUserInStorage;
  final OnLoadUserInStorage _onLoadUserInStorage;

  UserStore(this._onSaveUserInStorage, this._onLoadUserInStorage)
      : super(UserState.empty());

  UserModel get loadUser => value.currentUserAuthenticated;

  saveUser(UserModel userModel) async {
    await _onSaveUserInStorage.save(userModel);
    value = UserState.fromUserModel(userModel);
  }

  UserModel loadCurrentUser() {
    return value.currentUserAuthenticated;
  }

  loadUserInStorage() async {
    var currentUserInStorage = await _onLoadUserInStorage.load();

    if (currentUserInStorage.id != '') {
      value = UserState.fromUserModel(currentUserInStorage);
    }

    return currentUserInStorage;
  }
}
