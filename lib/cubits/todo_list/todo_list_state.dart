import 'package:todo_app_cifo/models/todo_model.dart';
import 'package:todo_app_cifo/utils/data.mock.dart';

class TodoListState {
  final List<TodoModel> todos;
  final int activeTodoCount;

  TodoListState({required this.todos, required this.activeTodoCount});

  factory TodoListState.initial() {
    return TodoListState(todos: todosUserMock, activeTodoCount: 0);
  }

  TodoListState copyWith({List<TodoModel>? todos, int? activeTodoCount}) {
    return TodoListState(
      todos: todos ?? this.todos,
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
