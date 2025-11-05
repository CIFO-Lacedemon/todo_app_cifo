import 'package:flutter/material.dart';

class TodoHeaderWidget extends StatelessWidget {
  final int count;
  const TodoHeaderWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("TODO", style: TextStyle(fontSize: 40)),
        Text("Tareas por realizar: $count"),
      ],
    );
  }
}
