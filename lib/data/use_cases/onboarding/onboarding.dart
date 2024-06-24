import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/data/provider/storage/onboarding/storage_onboarding.dart';
import 'package:projectzeta/domain/model/onboarding/onboarding.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';

class OnLoadOnboardingImplementation
    implements OnLoadOnboarding, OnSaveOnboarding {
  final StorageOnboarding storageOnboarding;

  OnLoadOnboardingImplementation({required this.storageOnboarding});

  @override
  Future<OnboardingModel> findByUser(UserModel userModel) async {
    var userInStorage = await storageOnboarding.findByUserId(userModel.id);

    if (userInStorage is OnboardingEntityNotFindUser) {
      return OnboardingModelNotExistsUser();
    }

    if (userInStorage is OnboardingEntityUserExists &&
        userInStorage.showOnboarding) {
      return OnboardingModelShow(
        user: UserModelNoEmpty.byUserEntity(
          userEntity: userInStorage.user,
        ),
      );
    }

    return OnboardingModelNotShow();
  }

  @override
  Future<bool> save(UserModel userModel) async {
    var saved = await storageOnboarding.onSave(
      OnboardingEntitySaveUser(
        user: UserEntityWithId(
          userModel.id,
        ),
      ),
    );

    return Future.value(saved);
  }
}
