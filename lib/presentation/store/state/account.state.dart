import 'package:projectzeta/domain/model/account/account_model.dart';

class AccountState {
  final String _id;
  final String _description;
  final double _balance;

  AccountState._internal(this._id, this._description, this._balance);

  String get id => _id;
  String get description => _description;
  double get balance => _balance;

  factory AccountState.empty() {
    return AccountState._internal("", "", 0.0);
  }

  factory AccountState.fromModel(AccountModel model) {
    return AccountState._internal(
      model.id,
      model.description,
      model.balance,
    );
  }
}
