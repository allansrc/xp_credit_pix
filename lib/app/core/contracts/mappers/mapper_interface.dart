abstract class MapperI<T> {
  Future<T> fromMap(Map<String, dynamic> json);
  T fromMapSync(Map<String, dynamic> json);
  Map toMap(T object);
  Future<void> checkJson(Map<String, dynamic> json);
}
