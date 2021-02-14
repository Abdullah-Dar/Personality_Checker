import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function handler;

  Result(this.totalScore, this.handler);

  var resultText = '"Agghh..you have the worst personality."';

  String get resultPhrase {
    if (totalScore < 32) {
      resultText = '"You are a bad guy."';
    }

    if (totalScore < 24) {
      resultText = '"You personality is un-appereciable."';
    }
    if (totalScore < 20) {
      resultText = '"Hmm..You need to improve yourself."';
    }
    if (totalScore < 16) {
      resultText = '"You have a neutral personality."';
    }
    if (totalScore < 12) {
      resultText = '"You are good."';
    }
    if (totalScore < 9) {
      resultText = '"Nice personality."';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      width: double.infinity,
      child: Column(children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
            padding: EdgeInsets.only(top: 25),
            child: RaisedButton(
              child: Text("Restart"),
              onPressed: handler,
            ))
      ]),
    );
  }
}
