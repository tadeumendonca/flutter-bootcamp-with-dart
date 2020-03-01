import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue[100],
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue[900],
          ),
          body: BallPage(),
        ),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Ball();
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  ballNumber = Random().nextInt(5) + 1;
                  print('I got clicked');
                });
              },
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}
