import 'package:flutter/material.dart';
import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';
import 'package:todo_app_cifo/modules/todo/ui/widgets/todo_item_widget.dart';

class ListTodosWidget extends StatelessWidget {
  final List<TodoModel> todos;
  const ListTodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItemWidget(
          desc: todos[index].desc,
          isCompleted: todos[index].completed,
          id: todos[index].id,
        );
      },
    );
  }
}
