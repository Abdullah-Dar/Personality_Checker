import 'package:flutter/material.dart';

import './Result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'question': "What's your favourite animal",
      'answer': [
        {'text': 'Elephant', 'score': 3},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Dog', 'score': 6},
      ]
    },
    {
      'question': "What's your favourite color",
      'answer': [
        {'text': 'Yellow', 'score': 3},
        {'text': 'Red', 'score': 8},
        {'text': 'White', 'score': 2},
        {'text': 'Black', 'score': 6},
      ]
    },
    {
      'question': "What's your favourite sports",
      'answer': [
        {'text': 'Cricket', 'score': 3},
        {'text': 'Snooker', 'score': 8},
        {'text': 'Hockey', 'score': 2},
        {'text': 'Boxing', 'score': 6},
      ]
    },
    {
      'question': "What's your  hobby",
      'answer': [
        {'text': 'Sleeping', 'score': 8},
        {'text': 'Reading Books', 'score': 2},
        {'text': 'Coding', 'score': 6},
        {'text': 'Physical Sports', 'score': 4},
      ]
    },
    {
      'question': "What's your favourite film",
      'answer': [
        {'text': 'Final Destination', 'score': 4},
        {'text': 'Ashiqui 2', 'score': 8},
        {'text': 'DHAMAL', 'score': 2},
        {'text': 'Insidius', 'score': 6},
      ]
    },
    {
      'question': "Do you obey your parents ?",
      'answer': [
        {'text': 'Yes ! I do.', 'score': -2},
        {'text': 'Hmm..Sometimes.', 'score': 6},
        {'text': 'Hehe No!', 'score': 8},
      ]
    },
  ];
  var questionIndex = 0;
  var totalScore = 0;
  
  var actualScore=0;
  void answerQuestion(int score) {
    setState(() {
     actualScore=score;
      questionIndex += 1;
      totalScore += score;
      
    });
  }


  void previous(){

    setState(() {
      questionIndex -= 1;
      totalScore=totalScore-actualScore;
    });
  }
  void restart() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("PERSONALITY CHECKER",style: TextStyle(color: Colors.red),),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
          
          child: questionIndex < questions.length
              ? Quiz(questionIndex, questions, answerQuestion,previous)
              : Result(totalScore, restart),
        ),
      ),
    );
  }
}
