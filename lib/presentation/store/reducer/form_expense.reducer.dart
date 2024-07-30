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

  handlerOnPressCategoryOption(ItemsKeyValue option) {}

  handlerOnPressAddExpense() {
    print(_state.input);
  }

  handlerOnPressPill(String text) {
    _changeDate(text);
    _state.setActivePillSelected(text);

    notifyListeners();
  }

  void _changeDate(String dateText) {
    Dates dates = Dates.values.firstWhere(
      (e) => e.value.toString().split('.').last == dateText,
      orElse: () => Dates.all,
    );

    if (dates == Dates.today) {
      _setDate(dateService.dateToday());
    } else if (dates == Dates.yesterday) {
      _setDate(dateService.dateYesterday());
    } else if (dates == Dates.tomorrow) {
      _setDate(dateService.dateTomorrow());
    }
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
