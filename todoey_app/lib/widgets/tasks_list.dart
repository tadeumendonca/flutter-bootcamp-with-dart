import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import 'package:todoeyapp/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
              taskTitle: widget.tasks[index].name,
              isChecked: widget.tasks[index].isDone,
              checkboxCallback: (currentState) {
                setState(() {
                  widget.tasks[index].toggleDone();
                });
              });
        });
  }
}
