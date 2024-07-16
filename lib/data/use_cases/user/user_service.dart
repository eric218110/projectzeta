import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/use_cases.dart';

class UserService implements OnLoadUserInStorage, OnSaveUserInStorage {
  final UserRepository userRepository;
  final String userStorageKey = "com.app.project.zeta.storage.keys.user";

  UserService({required this.userRepository});

  @override
  Future<bool> save(UserModel userModel) async {
    var userEntity = UserEntityByUserModel.create(userModel);

    var saved = await userRepository.onSave(
      userEntity.toStringList(),
      userStorageKey,
    );

    return saved;
  }

  @override
  Future<UserModel> load() async {
    var userInStorage = await userRepository.load(userStorageKey);

    if (userInStorage == null) {
      return UserModelIsEmpty();
    }

    return UserModelNoEmpty.byUserEntity(
      userEntity: UserEntityByUserModel.fromStringList(userInStorage),
    );
  }
}
