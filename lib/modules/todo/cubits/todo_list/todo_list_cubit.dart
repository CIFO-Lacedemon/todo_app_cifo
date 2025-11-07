import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_state.dart';
import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial()) {
    calculateActiveCount();
  }

  void toggleTodo(String id) {
    final List<TodoModel> newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return TodoModel(desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodos));

    calculateActiveCount();
  }

  void calculateActiveCount() {
    final int activeTodoCount = state.todos
        .where((element) => !element.completed)
        .toList()
        .length;
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
