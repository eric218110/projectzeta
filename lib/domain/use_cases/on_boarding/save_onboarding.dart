import 'package:projectzeta/domain/model/user/user.dart';

abstract class OnSaveOnboarding {
  Future<bool> save(UserModel userModel);
}
