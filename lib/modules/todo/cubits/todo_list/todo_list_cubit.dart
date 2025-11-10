import 'package:flutter/material.dart';
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
    setFilteredTodos(state.selectedFilter);

    calculateActiveCount();
  }

  void calculateActiveCount() {
    final int activeTodoCount = state.todos
        .where((element) => !element.completed)
        .toList()
        .length;
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }

  void setFilteredTodos(Filter filter) {
    List<TodoModel> filteredTodos;

    switch (filter) {
      case Filter.active:
        filteredTodos = state.todos
            .where((element) => element.completed == false)
            .toList();
        emit(state.copyWith(selectedFilter: Filter.active));
        break;
      case Filter.completed:
        filteredTodos = state.todos
            .where((element) => element.completed == true)
            .toList();
        emit(state.copyWith(selectedFilter: Filter.completed));
        break;
      case Filter.all:
        filteredTodos = state.todos;
        emit(state.copyWith(selectedFilter: Filter.all));
        break;
    }

    emit(state.copyWith(todosFiltered: filteredTodos));
  }

  void searchTodo(String text) {
    List<TodoModel> filteredTodos;

    if (state.selectedFilter == Filter.active) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .where((element) => element.completed == false)
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }

    if (state.selectedFilter == Filter.completed) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .where((element) => element.completed == true)
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }

    if (state.selectedFilter == Filter.all) {
      filteredTodos = state.todos
          .where((element) => element.desc.contains(text))
          .toList();
      emit(state.copyWith(todosFiltered: filteredTodos));
    }
  }

  void selectedCubit(TodoModel todo) {
    emit(state.copyWith(selectedTodo: todo));
  }

  void addTodo(String todoDesc) {
    final TodoModel newTodo = TodoModel(desc: todoDesc);

    final List<TodoModel> newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos, selectedFilter: Filter.all));

    setFilteredTodos(state.selectedFilter);
  }
}
