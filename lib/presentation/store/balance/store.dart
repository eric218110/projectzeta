import 'package:flutter/material.dart';
import 'package:projectzeta/domain/model/balance/balance_model.dart';
import 'package:projectzeta/domain/use_cases/balance/load_balance_by_user.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/store.dart';

class BalanceStore extends ValueNotifier<BalanceState> {
  final _loadBalanceByUser = getIt<LoadBalanceByUser>();
  final _userReducer = getIt<UserStore>();

  BalanceStore() : super(BalanceStateEmpty());

  double get balanceValue => value.value;

  Future<BalanceModel> onLoadBalanceByUser() async {
    var currentUser = await _userReducer.loadUserInStorage();
    var balance = await _loadBalanceByUser.load(currentUser);

    value = BalanceStateByModel(value: balance.value);

    return balance;
  }
}
