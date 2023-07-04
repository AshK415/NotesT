import 'dart:ui' show Color;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'todo.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  Note._();

  factory Note({
    int? id,
    String? title,
    String? description,
    Color? color,
    DateTime? dateTime,
    @Default([]) List<Todo> todos,
  }) = _Note;

  final DateFormat _formatter = DateFormat('MMMM dd, yyyy');
  String get date => dateTime != null ? _formatter.format(dateTime!) : '';

  final DateFormat _formatter1 = DateFormat('MMMM dd, yyyy h:m a');
  String get dateWithTime =>
      dateTime != null ? _formatter1.format(dateTime!) : '';

  bool get hasTodo => todos.isNotEmpty;
}
