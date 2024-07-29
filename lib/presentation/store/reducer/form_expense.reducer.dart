import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/store/state/state.dart';

class FormExpenseReducer extends ChangeNotifier {
  final _state = FormExpenseState.init();
  final dateFormat = getIt<FormateDate>();
  final dateService = getIt<Date>();

  FormExpenseState get state => _state;
  List<String> get pills => _state.pills;
  String get activePill => _state.activePill;
  bool get showDetails => _state.showDetail;
  Expense get input => _state.input;

  Future<void> nowUsingFormat() async {
    _setDate(dateService.dateToday());
  }

  handlerOnPressAddExpense() {
    print(_state.input);
  }

  handlerOnPressPill(String text) {
    Dates dates = Dates.values.firstWhere(
      (e) {
        return e.value.toString().split('.').last == text;
      },
      orElse: () => Dates.all,
    );

    if (dates == Dates.today) {
      _setDate(dateService.dateToday());
    } else if (dates == Dates.yesterday) {
      _setDate(dateService.dateYesterday());
    } else if (dates == Dates.tomorrow) {
      _setDate(dateService.dateTomorrow());
    }

    _state.setActivePillSelected(text);
    notifyListeners();
  }

  Future<void> _setDate(String date) async {
    var nowFormat = await dateFormat.onFormatByDate(date);
    _state.input.setDate(nowFormat);

    notifyListeners();
  }

  handlerOnToggleDetails() {
    _state.setShowDetail();
    notifyListeners();
  }
}
