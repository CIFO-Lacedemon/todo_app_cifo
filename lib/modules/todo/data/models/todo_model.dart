import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

enum Filter { all, active, completed }

class TodoModel {
  final String id;
  final String desc;
  final bool completed;

  TodoModel({String? id, required this.desc, this.completed = false})
    : id = id ?? uuid.v4();
}
