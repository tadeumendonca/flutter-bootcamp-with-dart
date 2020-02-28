import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://media.melhoresdestinos.com.br/2018/07/aurora-boreal-5-820x149.jpg'),
          ),
        ),
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Center(
            child: Text('I Am Rich'),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    ),
  );
}
