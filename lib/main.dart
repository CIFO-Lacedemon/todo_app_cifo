import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cifo/modules/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cifo/routes/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListCubit>(
      create: (context) => TodoListCubit(),
      child: MaterialApp.router(routerConfig: goRouter),
    );
  }
}
