import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskTile(
                  taskTitle: taskData.getTaskByIndex(index).name,
                  isChecked: taskData.getTaskByIndex(index).isDone,
                  checkboxCallback: (currentState) {
//                setState(() {
//                  taskData.tasks[index].toggleDone();
//                });
                  });
            });
      },
    );
  }
}
