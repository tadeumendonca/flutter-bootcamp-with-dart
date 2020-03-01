import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('images/icons8-hand-rock-80.png'),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text('I Am Poor')),
          backgroundColor: Colors.blueAccent,
        ),
      ),
    ),
  );
}
