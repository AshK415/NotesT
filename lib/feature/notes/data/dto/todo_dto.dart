import 'package:notest/feature/notes/domain/domain.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TodoDto {
  @Id()
  int id;
  final String? title;
  final bool? completed;

  TodoDto({required this.id, this.title, this.completed});

  factory TodoDto.fromDomain(Todo todo) {
    return TodoDto(completed: todo.completed, id: todo.id!, title: todo.title);
  }

  Todo toDomain() {
    return Todo(id: id, title: title, completed: completed ?? false);
  }
}
