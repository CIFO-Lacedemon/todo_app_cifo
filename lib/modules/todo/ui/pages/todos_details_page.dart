import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_state.dart';
import 'package:todo_app_cifo/modules/todo/data/models/todo_model.dart';

// class TodoDetailsObject {
//   final TodoModel? todoModel;

//   TodoDetailsObject({required this.todoModel});
// }

class TodosDetailsPage extends StatelessWidget {
  // final TodoDetailsObject todoDetailsObject;
  const TodosDetailsPage({
    super.key,

    // required this.todoDetailsObject
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, TodoListState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Text(state.selectedTodo?.desc ?? '')),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        );
      },
    );
  }
}
