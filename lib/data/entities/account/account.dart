import 'package:projectzeta/domain/model/model.dart';

class AccountEntity {
  final String uuid;
  final String description;
  final double balance;

  AccountEntity({
    required this.uuid,
    required this.description,
    required this.balance,
  });

  factory AccountEntity.fromJSON({required Map<String, dynamic> json}) {
    return AccountEntity(
      uuid: json['uuid'] ?? '',
      description: json['description'] ?? '',
      balance: double.parse(json['balance']),
    );
  }

  factory AccountEntity.fromModel(AccountModel accountModel) {
    return AccountEntity(
      uuid: accountModel.id,
      description: accountModel.description,
      balance: accountModel.balance,
    );
  }

  AccountModel toModel() => AccountModel(
        id: uuid,
        description: description,
        balance: balance,
      );
}
