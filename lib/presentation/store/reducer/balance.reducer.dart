import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';

class BalanceReducer with ChangeNotifier {
  final LoadBalanceByUser loadBalanceByUser;
  final AuthUserByEmailAndPassword authUserByEmailAndPassword;

  BalanceModel _balanceState = BalanceModel.empty();

  BalanceReducer({
    required this.loadBalanceByUser,
    required this.authUserByEmailAndPassword,
  });

  double get balanceValue => _balanceState.value;

  Future<BalanceModel> onLoadBalanceByUser() async {
    _balanceState = await loadBalanceByUser.load(
      authUserByEmailAndPassword.currentUserAuthenticated,
    );

    notifyListeners();

    return _balanceState;
  }

  factory BalanceReducer.create() {
    var loadBalanceByUser = getIt<LoadBalanceByUser>();
    var authUserByEmailAndPassword = AuthUserByEmailAndPassword.create();

    return BalanceReducer(
      authUserByEmailAndPassword: authUserByEmailAndPassword,
      loadBalanceByUser: loadBalanceByUser,
    );
  }
}
