import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_state.dart';
import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';

class FilterButton extends StatelessWidget {
  final Filter todo;
  const FilterButton({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return TextButton(
          child: Text(
            getSpanishNameTodo(todo),
            style: TextStyle(
              fontSize: 20,
              color: (state.selectedFilter == todo)
                  ? Colors.purple
                  : Colors.grey,
            ),
          ),
          onPressed: () {
            context.read<TodoListCubit>().setFilteredTodos(todo);
          },
        );
      },
    );
  }

  String getSpanishNameTodo(Filter todo) {
    switch (todo) {
      case Filter.all:
        return "Todos";
      case Filter.active:
        return "Activos";
      case Filter.completed:
        return "Completados";
    }
  }
}
