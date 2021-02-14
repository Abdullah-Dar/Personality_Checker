import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function handler;
  final questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz(this.questionIndex, this.questions, this.answerQuestion, this.handler);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        border: Border.all(color: Colors.brown,width: 3,style: BorderStyle.solid),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(40),
        ),
      
      child: Column(children: [
        Question(questions[questionIndex]['question']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map(
              (answer) => Container(
                  margin: EdgeInsets.only(left: 65, right: 65),
                  width: double.infinity,
                  child: Answer(
                      answer['text'], () => answerQuestion(answer['score']))),
            )
            .toList(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            margin: EdgeInsets.only(top: 45, bottom: 35),
            height: 1.0,
            width: 130.0,
            color: Colors.black,
          ),
        ),

        questionIndex!=0?
        RaisedButton(
          color: Colors.green,
          child: Text("Previous"),
          onPressed: handler,
        )

        :Container()

      ]),
    );
  }
}
