import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/utils/utils.dart';

class FormExpenseState {
  final List<String> _pills;
  final Expense _input;
  final Options _options;

  String _activePillSelected;
  double _expenseValue;
  bool _showDetails;

  List<String> get pills => _pills;
  Expense get input => _input;
  Options get options => _options;

  bool get showDetails => _showDetails;
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
    this._options,
  );

  factory FormExpenseState.init() {
    return FormExpenseState._internal(
      R.strings.today,
      0,
      Dates.all.toList,
      false,
      Expense.empty(today: ''),
      Options.empty(),
    );
  }
}

class ItemsKeyValueOptions extends ItemsKeyValue {
  final bool isSelected;

  ItemsKeyValueOptions({
    required super.key,
    required super.value,
    required this.isSelected,
  });

  factory ItemsKeyValueOptions.empty() {
    return ItemsKeyValueOptions(
      key: '',
      value: '',
      isSelected: false,
    );
  }
}

class Options {
  ItemsKeyValueOptions category;
  ItemsKeyValueOptions account;

  Options({
    required this.category,
    required this.account,
  });

  void setCategory(ItemsKeyValue option) {
    category = ItemsKeyValueOptions(
      isSelected: true,
      key: category.key,
      value: category.value,
    );
  }

  void setAccount(ItemsKeyValue option) {
    account = ItemsKeyValueOptions(
      isSelected: true,
      key: category.key,
      value: category.value,
    );
  }

  factory Options.empty() {
    return Options(
      category: ItemsKeyValueOptions.empty(),
      account: ItemsKeyValueOptions.empty(),
    );
  }
}
