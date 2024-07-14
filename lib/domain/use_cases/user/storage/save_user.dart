import 'package:projectzeta/domain/model/user/user.dart';

abstract class OnSaveUserInStorage {
  Future<bool> save(UserModel userModel);
}
