import 'package:notest/feature/notes/data/data.dart';

abstract class NoteRepository {
  List<NoteDto> getAllNotes();
  Future<NoteDto> getNote(int id);
  Future addUpdateNote(NoteDto note);
  Future deleteNote(int id);
  Future deleteMultiNotes(List<int> ids);
}
