import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool checked;

  TaskTile({this.title, this.checked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Checkbox(
        value: checked,
      ),
    );
  }
}
