import 'package:hive/hive.dart';
import 'package:tablet/Database/models/TodoType.dart';
import 'Notify.dart';
import 'User.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  Todo(
      {this.user,
      required this.notify,
      required this.todoType,
      this.description,
      this.isDone,
      this.key});
  @HiveField(0)
  User? user;
  @HiveField(1)
  Notify notify;
  @HiveField(2)
  String? description;
  @HiveField(3)
  bool? isDone = false;
  @HiveField(4)
  TodoType todoType;
  @HiveField(5)
  int? key;
}
