import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import 'package:todoeyapp/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              taskTitle: tasks[index].name,
              isChecked: tasks[index].isDone,
              checkboxCallback: (currentState) {
                setState(() {
                  tasks[index].toggleDone();
                });
              });
        });
  }
}
