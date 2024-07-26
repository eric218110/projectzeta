import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';

class BalanceReducer extends ChangeNotifier {
  final LoadBalanceByUser _loadBalanceByUser;
  final AuthUserByEmailAndPassword _authUserByEmailAndPassword;

  BalanceModel _balanceState = BalanceModel.empty();

  BalanceReducer(
    this._loadBalanceByUser,
    this._authUserByEmailAndPassword,
  );

  double get balanceValue => _balanceState.value;

  Future<BalanceModel> onLoadBalanceByUser() async {
    await _authUserByEmailAndPassword.loadCurrentUserInStorage();

    _balanceState = await _loadBalanceByUser.load(
      _authUserByEmailAndPassword.currentUserAuthenticated,
    );

    notifyListeners();

    return _balanceState;
  }

  factory BalanceReducer.create(BuildContext context) {
    var loadBalanceByUser = getIt<LoadBalanceByUser>();
    var authUserByEmailAndPassword = AuthUserByEmailAndPassword.create();

    return BalanceReducer(loadBalanceByUser, authUserByEmailAndPassword);
  }
}
