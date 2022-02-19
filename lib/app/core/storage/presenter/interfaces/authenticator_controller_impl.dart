abstract class IStorageController {
  Future<bool> delete(String key);
  Future<bool> clear();
  Future<bool> put(String key, Map value);
  Future<bool> update(String key, Map value);
  Future<Map> read(String key);
  Future<bool> containsKey(String key);
}
