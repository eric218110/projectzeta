import 'package:projectzeta/utils/utils.dart';

class FormExpenseState {
  String _today;
  String _activePillSelected;
  double _expenseValue;
  bool _showDetails;
  final List<String> _pills;

  FormExpenseState._internal(
    this._today,
    this._activePillSelected,
    this._expenseValue,
    this._pills,
    this._showDetails,
  );

  factory FormExpenseState.init() {
    return FormExpenseState._internal(
      '',
      R.strings.today,
      0,
      [
        R.strings.today,
        R.strings.yesterday,
        R.strings.tomorrow,
        "${R.strings.others}${R.strings.dots}",
      ],
      false,
    );
  }

  List<String> get pills => _pills;

  bool get showDetail => _showDetails;
  void setShowDetail() => _showDetails = !_showDetails;

  String get today => _today;
  void setToday(String today) => _today = today;

  String get activePill => _activePillSelected;
  void setActivePillSelected(String activePillSelected) =>
      _activePillSelected = activePillSelected;

  double get expenseValue => _expenseValue;
  void setExpenseValue(double expenseValue) => _expenseValue = expenseValue;
}
