import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/state.dart';

class UserReducer extends ChangeNotifier {
  var _state = UserState.empty();

  final OnSaveUserInStorage _onSaveUserInStorage;
  final OnLoadUserInStorage _onLoadUserInStorage;

  UserReducer(this._onSaveUserInStorage, this._onLoadUserInStorage);

  UserModel get loadUser => _state.currentUserAuthenticated;

  saveUser(UserModel userModel) async {
    await _onSaveUserInStorage.save(userModel);
    _state = UserState.fromUserModel(userModel);
    notifyListeners();
  }

  UserModel loadCurrentUser() {
    return _state.currentUserAuthenticated;
  }

  loadUserInStorage() async {
    var currentUserInStorage = await _onLoadUserInStorage.load();

    if (currentUserInStorage.id != '') {
      _state = UserState.fromUserModel(currentUserInStorage);
      notifyListeners();
    }

    return currentUserInStorage;
  }

  factory UserReducer.create() {
    var onSaveUserInStorage = getIt<OnSaveUserInStorage>();
    var onLoadUserInStorage = getIt<OnLoadUserInStorage>();

    return UserReducer(
      onSaveUserInStorage,
      onLoadUserInStorage,
    );
  }
}
