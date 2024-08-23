import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/domain/model/shared/page/page.dart' as page;
import 'package:projectzeta/presentation/store/store.dart';

class AccountStore extends ValueNotifier<AccountState> {
  final LoadAccountByUser loadAccountByUser;

  AccountStore(this.loadAccountByUser) : super(AccountState.empty());

  Future<void> loadAccountsByUser(UserModel user) async {
    var response = await loadAccountByUser.loadByUser(user, page.Page.init());

    value = AccountState.fromModelList(response);
  }
}
