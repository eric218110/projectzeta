import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/data/provider/storage/user/user.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/use_cases.dart';

class UserStorageImplementation
    implements OnLoadUserInStorage, OnSaveUserInStorage {
  final StorageUser storageUser;
  final String userStorageKey = "com.app.project.zeta.storage.keys.user";

  UserStorageImplementation({required this.storageUser});

  @override
  Future<bool> save(UserModel userModel) async {
    var userEntity = UserEntityByUserModel.create(userModel);

    var saved = await storageUser.onSave(
      userEntity.toStringList(),
      userStorageKey,
    );

    return saved;
  }

  @override
  Future<UserModel> load() async {
    var userInStorage = await storageUser.load(userStorageKey);

    if (userInStorage == null) {
      return UserModelIsEmpty();
    }

    return UserModelNoEmpty.byUserEntity(
      userEntity: UserEntityByUserModel.fromStringList(userInStorage),
    );
  }
}
