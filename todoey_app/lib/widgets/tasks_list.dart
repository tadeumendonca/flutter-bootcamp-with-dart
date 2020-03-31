import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          title: 'This is a task',
          checked: false,
        ),
      ],
    );
  }
}
