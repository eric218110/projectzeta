import 'package:projectzeta/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingImplementationWithSharedPreferences
    implements OnboardingRepository {
  OnboardingImplementationWithSharedPreferences();

  @override
  Future<OnboardingEntity> findByUserId(String userId) async {
    var sharedPreference = await _loadSharedPreferencesInstance();
    var findInLocalStorage = sharedPreference.getString(userId);

    if (findInLocalStorage == null) {
      return Future.value(OnboardingEntityNotFindUser());
    }

    UserEntity user = UserEntityWithId(findInLocalStorage);

    return Future.value(
      OnboardingEntityUserExists(
        user: user,
        showOnboarding: false,
      ),
    );
  }

  @override
  Future<bool> onSave(OnboardingEntity onboardingEntity) async {
    try {
      var sharedPreference = await _loadSharedPreferencesInstance();
      return sharedPreference.setString(
          onboardingEntity.user.id, onboardingEntity.user.id);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<SharedPreferences> _loadSharedPreferencesInstance() {
    return SharedPreferences.getInstance();
  }
}
