import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  factory Todo({
    String? title,
    int? id,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.empty() {
    //const uuid = Uuid();
    return Todo(
      title: '',
      completed: false,
    );
  }
}
