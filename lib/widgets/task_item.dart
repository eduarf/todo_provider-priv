import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task_model.dart';
import 'package:todo_provider/providers/task_prodiver.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context);
    final task = Provider.of<Task>(context);
    return Card(
      color: task.isOkey ? Colors.green : Colors.red,
      child: ListTile(
        leading: IconButton(
          icon: const Icon(Icons.check),
          onPressed: (){
            task.toggleIsOkey();
          },
        ),
        title: Text(
          task.task,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: IconButton(
          onPressed: () {
            tasks.deleteTask(task: task);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
