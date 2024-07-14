import 'package:projectzeta/domain/model/user/user.dart';

abstract class OnLoadUserInStorage {
  Future<UserModel> load();
}
