abstract class Database {
  T get<T>(int id);
  List<T> getAll<T>();
  Future delete(int id);
  Future deleteAll(List<int> keys);
  Future addUpdate<T>(int id, T item);
}
