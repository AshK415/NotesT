import 'package:notest/feature/notes/domain/domain.dart';
import 'package:notest/objectbox.g.dart';
import 'package:notest/shared/providers/top_level_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<Note>> getNotes(GetNotesRef ref) {
  final obox = ref.watch(objectBox);
  final qBuilderNotes =
      obox.noteBox.query().order(NoteDto_.dateTime, flags: Order.descending);
  return qBuilderNotes
      .watch(triggerImmediately: true)
      .map((query) => query.find().map((e) => e.toDomain()).toList());
}
