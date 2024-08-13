import 'package:projectzeta/data/entities/entities.dart';

abstract class AccountRepository {
  Future<List<AccountEntity>> loadByUserId(String key);
}
