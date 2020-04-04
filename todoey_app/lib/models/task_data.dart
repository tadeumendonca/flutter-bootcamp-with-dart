import 'package:flutter/material.dart';
import 'package:todoeyapp/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final newTask = Task(name: newTaskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  Task getTaskByIndex(int index) {
    return _tasks[index];
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
