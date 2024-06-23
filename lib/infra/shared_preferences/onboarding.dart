import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/data/entities/onboarding/onboarding.dart';
import 'package:projectzeta/data/provider/decode/encode.dart';
import 'package:projectzeta/data/provider/encode/encode.dart';
import 'package:projectzeta/data/provider/storage/onboarding/storage_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingImplementationWithSharedPreferences
    implements StorageOnboarding {
  final Encode _encoder;
  final Decode _decoder;

  OnboardingImplementationWithSharedPreferences(this._encoder, this._decoder);

  @override
  Future<OnboardingEntity> findByUserId(String userId) async {
    var sharedPreference = await _loadSharedPreferencesInstance();
    var findInLocalStorage = sharedPreference.getString(userId);

    if (findInLocalStorage == null) {
      return Future.value(OnboardingEntityNotFindUser());
    }

    var onboardingEntity =
        _decoder.onDecodeByStringObject<OnboardingEntity>(findInLocalStorage);

    return Future.value(
      OnboardingEntityUserExists(
        user: onboardingEntity.user,
        showOnboarding: false,
      ),
    );
  }

  @override
  Future<bool> onSave(OnboardingEntity onboardingEntity) async {
    try {
      var sharedPreference = await _loadSharedPreferencesInstance();
      String valueForSave = _encoder.onEncodeByObjectToString(onboardingEntity);
      return sharedPreference.setString(onboardingEntity.user.id, valueForSave);
    } catch (e) {
      return Future.value(false);
    }
  }

  Future<SharedPreferences> _loadSharedPreferencesInstance() {
    return SharedPreferences.getInstance();
  }
}
