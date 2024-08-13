import 'package:projectzeta/domain/domain.dart';

abstract class LoadAccountByUser {
  Future<List<AccountModel>> loadByUser(UserModel userModel, Page page);
}
