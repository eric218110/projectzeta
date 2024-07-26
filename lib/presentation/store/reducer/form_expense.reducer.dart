import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/state.dart';

class FormExpenseReducer extends ChangeNotifier {
  final _state = FormExpenseState.init();

  FormExpenseState get state => _state;
  List<String> get pills => _state.pills;
  String get today => _state.today;
  String get activePill => _state.activePill;

  Future<void> nowUsingFormat() async {
    var dateFormat = getIt<FormateDate>();
    var now = await dateFormat.onFormatNow();
    _state.setToday(now);
    notifyListeners();
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
