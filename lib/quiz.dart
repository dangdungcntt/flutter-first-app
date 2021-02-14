import 'package:firstapp/answer.dart';
import 'package:firstapp/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final Map question;
  final Function answerQuestion;

  Quiz({
    @required this.question,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(this.question['question']),
        ...(this.question['answers'] as List)
            .map((answer) => Answer(
                  onPressed: () => this
                      .answerQuestion(answer, this.question['correctAnswer']),
                  text: answer,
                ))
            .toList()
      ],
    );
  }
}
