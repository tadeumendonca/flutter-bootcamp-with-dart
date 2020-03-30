import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

CupertinoAlertDialog showIOSDialog(
    BuildContext context, String title, String message) {
  return CupertinoAlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: new Text("Close"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

AlertDialog showAndroidDialog(
    BuildContext context, String title, String message) {
  return AlertDialog(
    title: new Text(title),
    content: new Text(message),
    actions: <Widget>[
      // usually buttons at the bottom of the dialog
      new FlatButton(
        child: new Text("Close"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}

void showAppDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Platform.isIOS
        ? showIOSDialog(context, title, message)
        : showAndroidDialog(context, title, message),
  );
}
