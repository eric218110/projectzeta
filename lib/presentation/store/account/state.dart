import 'package:projectzeta/domain/model/account/account_model.dart';

class AccountState {
  final List<Account> accounts;

  factory AccountState.empty() {
    return AccountState(accounts: List.empty());
  }

  factory AccountState.fromModelList(List<AccountModel> accountList) {
    final accounts =
        accountList.map((account) => Account.fromModel(account)).toList();

    return AccountState(accounts: accounts);
  }

  AccountState({required this.accounts});
}

class Account {
  final String id;
  final String description;
  final double balance;

  Account({
    required this.id,
    required this.description,
    required this.balance,
  });

  factory Account.fromModel(AccountModel model) {
    return Account(
      id: model.id,
      description: model.description,
      balance: model.balance,
    );
  }
}
