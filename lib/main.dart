import 'package:firstapp/quiz.dart';
import 'package:firstapp/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _correctedAnswers = 0;
  List<Map> _questions = [
    {
      'question': 'Question 1',
      'answers': ['One', 'Three'],
      'correctAnswer': 'One'
    },
    {
      'question': 'Question 2',
      'answers': ['One', 'Two'],
      'correctAnswer': 'Two'
    },
    {
      'question': 'Question 3',
      'answers': ['One', 'Two', 'Three'],
      'correctAnswer': 'Three'
    },
  ];

  void _answerQuestion(String answer, String correctAnswer) {
    if (answer == correctAnswer) {
      _correctedAnswers++;
    }

    this.setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex++;
      }
    });
  }

  void _onRestart() {
    this.setState(() {
      this._correctedAnswers = 0;
      this._questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: this._questionIndex < this._questions.length
              ? Quiz(
                  question: this._questions[this._questionIndex],
                  answerQuestion: this._answerQuestion,
                )
              : Result(
                  correctedAnswers: this._correctedAnswers,
                  total: this._questions.length,
                  onRestart: this._onRestart,
                ),
        ),
      ),
    );
  }
}
