import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/task_model.dart';
import 'package:todo_provider/providers/task_prodiver.dart';
import 'package:todo_provider/widgets/task_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = 'What will you do today?';
    final taskProvider = Provider.of<TaskProvider>(context);
    final getTasks = taskProvider.tasks;
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: TextField(
                        style: Theme.of(context).textTheme.headline5,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Add a task',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          DatePicker.showTimePicker(context,
                              showSecondsColumn: false, onConfirm: (date) {
                            Task addTask = Task.create(task: value, date: date);
                            taskProvider.addTask(task: addTask);
                            Navigator.of(context).pop();
                          });
                        },
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.add,
              color: ThemeData().iconTheme.color,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: getTasks.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: getTasks[index],
          child: const TaskItem(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ThemeData().iconTheme.color,
        ),
      ),
    );
  }
}
