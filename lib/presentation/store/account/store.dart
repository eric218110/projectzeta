import 'package:flutter/material.dart';
import 'package:projectzeta/presentation/store/store.dart';

class AccountStore extends ValueNotifier<AccountState> {
  AccountStore() : super(AccountState.empty());

  loadAccountsByUser() async {}
}
