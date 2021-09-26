import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resulttext = 'You did it !';

    if (resultScore <= 30) {
      resulttext = 'you are awesome and innocent !';
    } else if (resultScore >= 40) {
      resulttext = 'Pretty likeable !';
    } else {
      resulttext = 'You are ....strange ?';
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
