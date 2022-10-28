import 'package:flutter/material.dart';
import 'package:todo_provider/models/task_model.dart';

class TaskProvider with ChangeNotifier{

  final List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask({required Task task}){
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask({required Task task}){
    _tasks.remove(task);
    notifyListeners();
  }

}