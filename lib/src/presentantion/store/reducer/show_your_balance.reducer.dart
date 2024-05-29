import 'package:flutter/material.dart';
import 'package:projectzeta/src/presentantion/store/state/state.dart';

class ShowYourBalanceReducer extends ChangeNotifier {
  ShowYourBalanceState state = ShowYourBalanceState();

  getYourBalance() {
    return state.isShowYourBalance;
  }

  bool toggleYourBalance() {
    state.isShowYourBalance = !state.isShowYourBalance;
    notifyListeners();

    return state.isShowYourBalance;
  }
}
