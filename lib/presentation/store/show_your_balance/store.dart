import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/store/show_your_balance/state.dart';

class ShowYourBalanceStore extends ValueNotifier<ShowYourBalanceState> {
  ShowYourBalanceStore()
      : super(ShowYourBalanceState(isShowYourBalance: false));

  bool get isShowYourBalance => value.isShowYourBalance;

  bool toggleYourBalance() {
    value = ShowYourBalanceState(isShowYourBalance: !value.isShowYourBalance);
    return value.isShowYourBalance;
  }
}
