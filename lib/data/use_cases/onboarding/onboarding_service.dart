import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/model/onboarding/onboarding.dart';
import 'package:projectzeta/domain/model/user/user.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/load_onboarding.dart';
import 'package:projectzeta/domain/use_cases/on_boarding/save_onboarding.dart';

class OnboardingService implements OnLoadOnboarding, OnSaveOnboarding {
  final OnboardingRepository onboardingRepository;

  OnboardingService({required this.onboardingRepository});

  @override
  Future<OnboardingModel> findByUser(UserModel userModel) async {
    var userInStorage = await onboardingRepository.findByUserId(userModel.id);

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
    var saved = await onboardingRepository.onSave(
      OnboardingEntitySaveUser(
        user: UserEntityWithId(
          userModel.id,
        ),
      ),
    );

    return Future.value(saved);
  }
}
