import 'package:projectzeta/domain/model/user/user.dart';

abstract class AuthByEmailAndPassword {
  Future<UserModel?> onAuth();
}
