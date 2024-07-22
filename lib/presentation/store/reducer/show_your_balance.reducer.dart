import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/store/state/state.dart';

class ShowYourBalanceReducer extends ChangeNotifier {
  final _state = ShowYourBalanceState();

  bool get isShowYourBalance => _state.isShowYourBalance;

  bool toggleYourBalance() {
    _state.isShowYourBalance = !_state.isShowYourBalance;
    notifyListeners();

    return _state.isShowYourBalance;
  }
}
