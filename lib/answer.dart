import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        answerText,
        style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple),
      ),
      onPressed: selectHandler,
      hoverElevation: 6,
      elevation: 2,
      color: Colors.grey,
    );
  }
}
