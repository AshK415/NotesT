import 'package:notest/feature/notes/data/data.dart';
import 'package:notest/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store _store;
  late final Box<NoteDto> _notesBox;
  late final Box<TodoDto> _todoBox;
  Box<NoteDto> get noteBox => _notesBox;
  Box<TodoDto> get todoBox => _todoBox;

  ObjectBox._create(this._store) {
    _notesBox = Box<NoteDto>(_store);
    _todoBox = Box<TodoDto>(_store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore(
        directory:
            p.join((await getApplicationDocumentsDirectory()).path, "notest"));
    return ObjectBox._create(store);
  }
}
