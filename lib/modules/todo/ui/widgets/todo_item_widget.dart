import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';
import 'package:todo_app_cifo/modules/todo/ui/pages/todos_details_page.dart';
import 'package:todo_app_cifo/routes/app_router.dart';

class TodoItemWidget extends StatelessWidget {
  final String desc;
  final String id;
  final bool isCompleted;
  final TodoModel todoModel;
  const TodoItemWidget({
    Key? key,
    required this.desc,
    required this.id,
    required this.isCompleted,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // context.goNamed(
        //   AppRouter.details.name,
        //   extra: TodoDetailsObject(todoModel: todoModel),
        // );

        context.read<TodoListCubit>().selectedCubit(todoModel);

        context.goNamed(AppRouter.details.name);
      },
      title: Text(desc),
      leading: Checkbox(
        value: isCompleted,
        onChanged: (value) {
          print(value);
          print(isCompleted);
          context.read<TodoListCubit>().toggleTodo(id);
        },
      ),
    );
  }
}
