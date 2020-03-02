import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded createButton({int audioNumber, Color backgroundColor}) {
    return Expanded(
      child: FlatButton(
          color: backgroundColor,
          onPressed: () {
            final player = AudioCache();
            player.play('note$audioNumber.wav');
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              createButton(audioNumber: 1, backgroundColor: Colors.red),
              createButton(audioNumber: 2, backgroundColor: Colors.orange),
              createButton(audioNumber: 3, backgroundColor: Colors.yellow),
              createButton(audioNumber: 4, backgroundColor: Colors.green),
              createButton(audioNumber: 5, backgroundColor: Colors.teal),
              createButton(audioNumber: 6, backgroundColor: Colors.blue),
              createButton(audioNumber: 7, backgroundColor: Colors.purple)
            ],
          ),
        ),
      ),
    );
  }
}
