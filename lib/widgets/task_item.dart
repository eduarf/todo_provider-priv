import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return Card(
      color: task.isOkey ? Colors.yellow : Colors.red,
      child: ListTile(
        title: Text(task.task),
        leading: IconButton(
          onPressed: () {
            task.toggleIsOkey();
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
