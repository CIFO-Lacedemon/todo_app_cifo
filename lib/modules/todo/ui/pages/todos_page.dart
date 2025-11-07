import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_state.dart';
import 'package:todo_app_cifo/modules/todo/ui/widgets/search_filter_todo_widget.dart';
import 'package:todo_app_cifo/modules/todo/ui/widgets/todo_header_widget.dart';
import 'package:todo_app_cifo/modules/todo/ui/widgets/todo_item_widget.dart';
import 'package:todo_app_cifo/modules/todo/data/utils/data.mock.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70),
          BlocBuilder<TodoListCubit, TodoListState>(
            builder: (context, state) {
              return TodoHeaderWidget(count: state.activeTodoCount);
            },
          ),
          SizedBox(height: 20),
          SearchFilterTodoWidget(),
          BlocBuilder<TodoListCubit, TodoListState>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  return TodoItemWidget(
                    desc: state.todos[index].desc,
                    isCompleted: state.todos[index].completed,
                    id: state.todos[index].id,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
