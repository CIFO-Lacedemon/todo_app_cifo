import 'package:flutter/material.dart';
import 'package:todo_app_cifo/ui/widgets/search_filter_todo_widget.dart';
import 'package:todo_app_cifo/ui/widgets/todo_header_widget.dart';
import 'package:todo_app_cifo/ui/widgets/todo_item_widget.dart';
import 'package:todo_app_cifo/utils/data.mock.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 70),
          TodoHeaderWidget(),
          SizedBox(height: 20),
          SearchFilterTodoWidget(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: todosUserMock.length,
            itemBuilder: (context, index) {
              return TodoItemWidget(
                desc: todosUserMock[index].desc,
                isCompleted: todosUserMock[index].completed,
              );
            },
          ),
        ],
      ),
    );
  }
}
