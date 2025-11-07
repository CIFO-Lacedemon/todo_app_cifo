import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';

class TodoItemWidget extends StatelessWidget {
  final String desc;
  final String id;
  final bool isCompleted;
  const TodoItemWidget({
    Key? key,
    required this.desc,
    required this.id,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
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
