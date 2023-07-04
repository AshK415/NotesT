import 'package:notest/feature/notes/data/data.dart';
import 'package:notest/feature/notes/domain/domain.dart';
import 'package:notest/shared/object_box.dart';

class DatabaseImpl implements Database {
  final ObjectBox _objectBox;

  const DatabaseImpl(this._objectBox);

  @override
  Future addUpdate<T>(int id, T item) async {
    try {
      if (T is NoteDto) {
        final note = T as NoteDto;
        await _objectBox.noteBox.putAndGetAsync(note);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future delete(int id) async {
    try {
      await _objectBox.noteBox.removeAsync(id);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteAll(List<int> keys) async {
    try {
      await _objectBox.noteBox.removeManyAsync(keys);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  T get<T>(int id) {
    try {
      final data = _objectBox.noteBox.get(id);
      if (data == null) throw Exception('No record found');
      return data as T;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  List<T> getAll<T>() {
    try {
      final data = _objectBox.noteBox.getAll();
      if (data.isEmpty) {
        throw Exception('No record found');
      }
      return data.toList().cast<T>();
    } on Exception catch (_) {
      rethrow;
    }
  }
}
