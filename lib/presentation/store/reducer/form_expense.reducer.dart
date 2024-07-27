import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/state.dart';

class FormExpenseReducer extends ChangeNotifier {
  final _state = FormExpenseState.init();

  FormExpenseState get state => _state;
  List<String> get pills => _state.pills;
  String get activePill => _state.activePill;
  bool get showDetails => _state.showDetail;
  Expense get input => _state.input;

  Future<void> nowUsingFormat() async {
    var dateFormat = getIt<FormateDate>();
    var now = await dateFormat.onFormatNow();
    _state.input.setDate(now);
    notifyListeners();
  }

  handlerOnPressAddExpense() {
    print(_state.input);
  }

  handlerOnPressPill(String text) {
    _state.setActivePillSelected(text);
    notifyListeners();
  }

  handlerOnToggleDetails() {
    _state.setShowDetail();
    notifyListeners();
  }
}
