import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_provider/models/task_model.dart';

class TaskProvider with ChangeNotifier{

  List<Task> _tasks = [];
  Box<Task> taskBox = Hive.box('tasks');

  List<Task> get tasks{
    _tasks = taskBox.values.toList();
    return [..._tasks];
  }

  Future addTask({required Task task})async{ 
    await taskBox.put(task.id, task);
    _tasks.add(task);
    notifyListeners();
  }

  Future deleteTask({required Task task})async{
    await taskBox.delete(task.id);
    _tasks.remove(task);
    notifyListeners();
  }
    void toggleIsOkey({required Task task}){
      Task updateTask = _tasks.firstWhere((element) => element.id == task.id);
      updateTask.isOkey = !updateTask.isOkey;
      taskBox.put(task.id, updateTask);
      notifyListeners();
  }

}