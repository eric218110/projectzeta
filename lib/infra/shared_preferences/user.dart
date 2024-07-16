import 'package:projectzeta/data/provider/repository/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserImplementationWithSharedPreferences implements UserRepository {
  UserImplementationWithSharedPreferences();

  @override
  Future<bool> onSave(List<String> userInStringList, String key) async {
    try {
      var sharedPreference = await _loadSharedPreferencesInstance();
      return sharedPreference.setStringList(key, userInStringList);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<List<String>?> load(String key) async {
    var sharedPreference = await _loadSharedPreferencesInstance();

    return sharedPreference.getStringList(key);
  }

  Future<SharedPreferences> _loadSharedPreferencesInstance() {
    return SharedPreferences.getInstance();
  }
}
