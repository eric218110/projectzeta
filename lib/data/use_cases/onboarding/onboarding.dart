import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/data/provider/storage/onboarding/storage_onboarding.dart';
import 'package:projectzeta/domain/model/onboarding/onboarding.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';

class OnLoadOnboardingImplementation implements OnLoadOnboarding {
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
      return OnboardingModelShow(user: userInStorage.user);
    }

    return OnboardingModelNotShow();
  }
}
