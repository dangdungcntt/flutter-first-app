import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int correctedAnswers;
  final int total;
  final Function onRestart;

  Result({this.correctedAnswers, this.total, @required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Done',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Text(
            'Correct $correctedAnswers/$total',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.refresh),
            label: Text('Restart'),
            onPressed: this.onRestart,
          )
        ],
      ),
    );
  }
}
