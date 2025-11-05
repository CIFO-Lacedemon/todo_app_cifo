import 'package:flutter/material.dart';
import 'package:todo_app_cifo/ui/widgets/filter_button.dart';

class SearchFilterTodoWidget extends StatelessWidget {
  const SearchFilterTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Buscar Tareas....',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),

          onChanged: (value) {
            print("onChanged");
          },
          onSubmitted: (value) {
            print("OnSubmitted");
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterButton(text: "Todos"),
            FilterButton(text: "Activos"),
            FilterButton(text: "Completados"),
          ],
        ),
      ],
    );
  }
}
