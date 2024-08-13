import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:provider/provider.dart';

class BalanceReducer extends ChangeNotifier {
  final LoadBalanceByUser _loadBalanceByUser;
  final UserReducer _userReducer;

  BalanceModel _balanceState = BalanceModel.empty();

  BalanceReducer(
    this._loadBalanceByUser,
    this._userReducer,
  );

  double get balanceValue => _balanceState.value;

  Future<BalanceModel> onLoadBalanceByUser() async {
    var currentUser = await _userReducer.loadUserInStorage();
    _balanceState = await _loadBalanceByUser.load(currentUser);

    notifyListeners();

    return _balanceState;
  }

  factory BalanceReducer.create(BuildContext context) {
    var loadBalanceByUser = getIt<LoadBalanceByUser>();
    var userReducer = Provider.of<UserReducer>(context, listen: false);

    return BalanceReducer(loadBalanceByUser, userReducer);
  }
}
