import 'package:projectzeta/domain/model/user/user.dart';

class UserState {
  final UserModel currentUserAuthenticated;

  UserState._internal(this.currentUserAuthenticated);

  factory UserState.empty() {
    return UserState._internal(UserModelIsEmpty());
  }

  factory UserState.fromUserModel(UserModel userModel) {
    return UserState._internal(userModel);
  }
}
