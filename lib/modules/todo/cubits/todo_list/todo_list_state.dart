import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';
import 'package:todo_app_cifo/modules/todo/data/utils/data.mock.dart';

class TodoListState {
  final List<TodoModel> todos;
  final List<TodoModel> todosFiltered;
  final Filter selectedFilter;
  final int activeTodoCount;
  final TodoModel? selectedTodo;

  TodoListState({
    required this.todos,
    required this.activeTodoCount,
    required this.todosFiltered,
    required this.selectedFilter,
    required this.selectedTodo,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todos: todosUserMock,
      activeTodoCount: 0,
      todosFiltered: [],
      selectedFilter: Filter.all,
      selectedTodo: null,
    );
  }

  TodoListState copyWith({
    List<TodoModel>? todos,
    int? activeTodoCount,
    List<TodoModel>? todosFiltered,
    Filter? selectedFilter,
    TodoModel? selectedTodo,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
      todosFiltered: todosFiltered ?? this.todosFiltered,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedTodo: selectedTodo ?? this.selectedTodo,
    );
  }
}
