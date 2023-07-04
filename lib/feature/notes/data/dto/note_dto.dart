import 'package:notest/feature/notes/data/dto/todo_dto.dart';
import 'package:notest/feature/notes/domain/domain.dart';
import 'package:objectbox/objectbox.dart';
import 'dart:ui' show Color;

@Entity()
class NoteDto implements Comparable {
  NoteDto({
    this.id = 0,
    this.title,
    this.colorValue,
    this.dateTime,
    this.description,
  });

  @Id()
  int id;
  final String? title;
  final String? description;
  final int? colorValue;
  final String? dateTime;
  final todoList = ToMany<TodoDto>();

  factory NoteDto.fromNote(Note note) {
    final noteDto = NoteDto(
      id: note.id!,
      title: note.title,
      description: note.description,
      colorValue: note.color?.value,
      dateTime: note.dateTime?.toIso8601String(),
    );
    noteDto.todoList
        .addAll(note.todos.map((e) => TodoDto.fromDomain(e)).toList());
    return noteDto;
  }

  Note toDomain() {
    return Note(
      id: id,
      title: title,
      description: description,
      dateTime: DateTime.parse(dateTime!),
      color: Color(colorValue!),
      todos: todoList.map((td) => td.toDomain()).toList(),
    );
  }

  bool get validNote => title?.isNotEmpty == true;

  NoteDto copyWith(
          {String? title,
          String? description,
          int? colorValue,
          String? dateTime,
          List<TodoDto>? todoList}) =>
      NoteDto(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        colorValue: colorValue ?? this.colorValue,
        dateTime: dateTime ?? this.dateTime,
      );

  @override
  int compareTo(other) {
    try {
      final isAfter =
          DateTime.parse(other.dateTime).isAfter(DateTime.parse(dateTime!));
      return isAfter ? 1 : -1;
    } on Exception catch (_) {
      return 1;
    }
  }
}
