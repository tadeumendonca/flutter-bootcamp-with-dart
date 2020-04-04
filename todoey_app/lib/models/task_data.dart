import 'package:flutter/material.dart';
import 'package:todoeyapp/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
