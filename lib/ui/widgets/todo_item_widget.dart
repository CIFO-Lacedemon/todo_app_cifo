import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  final String desc;
  final bool isCompleted;
  const TodoItemWidget({
    Key? key,
    required this.desc,
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
        },
      ),
    );
  }
}
