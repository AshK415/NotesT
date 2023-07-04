import 'package:notest/feature/notes/data/data.dart';
import 'package:notest/feature/notes/domain/domain.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl(this._database);

  final Database _database;
  @override
  Future addUpdateNote(NoteDto note) async {
    try {
      await _database.addUpdate(note.id, note);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteMultiNotes(List<int> ids) async {
    try {
      await _database.deleteAll(ids);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteNote(int id) async {
    try {
      await _database.delete(id);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  List<NoteDto> getAllNotes() {
    try {
      final notesDto = _database.getAll().map((e) => e as NoteDto).toList();
      return notesDto;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<NoteDto> getNote(int id) async {
    try {
      final noteDto = await _database.get(id) as NoteDto;
      return noteDto;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
