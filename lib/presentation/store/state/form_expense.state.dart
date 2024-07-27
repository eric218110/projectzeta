import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/utils/utils.dart';

class FormExpenseState {
  String _activePillSelected;
  double _expenseValue;
  bool _showDetails;
  final List<String> _pills;
  final Expense _input;

  List<String> get pills => _pills;
  Expense get input => _input;

  bool get showDetail => _showDetails;
  void setShowDetail() => _showDetails = !_showDetails;

  String get activePill => _activePillSelected;
  void setActivePillSelected(String value) => _activePillSelected = value;

  double get expenseValue => _expenseValue;
  void setExpenseValue(double value) => _expenseValue = value;

  FormExpenseState._internal(
    this._activePillSelected,
    this._expenseValue,
    this._pills,
    this._showDetails,
    this._input,
  );

  factory FormExpenseState.init() {
    return FormExpenseState._internal(
      R.strings.today,
      0,
      [
        R.strings.today,
        R.strings.yesterday,
        R.strings.tomorrow,
        "${R.strings.others}${R.strings.dots}",
      ],
      false,
      Expense.empty(today: ''),
    );
  }
}
