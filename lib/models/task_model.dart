import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class Task with ChangeNotifier{
  final String id;
  final String task;
  final DateTime date;
  bool isOkey;

  Task({
    required this.id,
    required this.task,
    required this.date,
    this.isOkey = false,
  });

  factory Task.create({required String task, required DateTime date}){
    return Task(id: const Uuid().v1(), task: task, date: date);
  }
    void toggleIsOkey(){
    isOkey = !isOkey;
    notifyListeners();
  }
}
