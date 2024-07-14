abstract class StorageUser {
  Future<List<String>?> load(String key);
  Future<bool> onSave(List<String> userInListString, String key);
}
