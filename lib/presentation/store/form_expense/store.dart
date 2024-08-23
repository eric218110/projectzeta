import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/presentation/store/form_expense/state.dart';

class FormExpenseStore extends ValueNotifier<FormExpenseState> {
  final FormateDate _dateFormat;
  final Date _dateService;

  FormExpenseStore(this._dateFormat, this._dateService)
      : super(FormExpenseState.init());

  FormExpenseState get state => value;
  List<String> get pills => value.pills;
  String get activePill => value.activePill;
  bool get showDetails => value.showDetails;
  Expense get input => value.input;

  Future<void> nowUsingFormat() async {
    _setDate(_dateService.dateToday());
  }

  handlerOnPressCategoryOption(ItemsKeyValue option) {
    value.input.setCategory(option.key);
    value.options.setCategory(option);
    notifyListeners();
  }

  handlerOnPressAccountOption(ItemsKeyValue option) {
    value.input.setAccount(option.key);
    value.options.setAccount(option);
    notifyListeners();
  }

  handlerOnPressAddExpense() {
    print(value.input);
  }

  handlerOnPressPill(String text) {
    _changeDate(text);
    value.setActivePillSelected(text);
    notifyListeners();
  }

  void _changeDate(String dateText) {
    Dates dates = Dates.values.firstWhere(
      (e) => e.value.toString().split('.').last == dateText,
      orElse: () => Dates.all,
    );

    if (dates == Dates.today) {
      _setDate(_dateService.dateToday());
    } else if (dates == Dates.yesterday) {
      _setDate(_dateService.dateYesterday());
    } else if (dates == Dates.tomorrow) {
      _setDate(_dateService.dateTomorrow());
    }
  }

  Future<void> _setDate(String date) async {
    var nowFormat = await _dateFormat.onFormatByDate(date);
    value.input.setDate(nowFormat);
    notifyListeners();
  }

  handlerOnToggleDetails() {
    value.setShowDetail();
    notifyListeners();
  }
}
