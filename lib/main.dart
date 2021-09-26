import 'package:flutter/material.dart';

import './answer.dart';

import './quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;
  var _questions = [
    {
      'questionText': "What\'s is your favourite color?",
      'answers': [
        {"text": "Black", "score": 10},
        {"text": 'Red', "score": 5},
        {"text": 'Green', "score": 3},
        {"text": 'White', "score": 1},
      ],
    },
    {
      'questionText': "What\'s is your favourite animal?",
      'answers': [
        {"text": "Lion", "score": 20},
        {"text": 'Snake', "score": 10},
        {"text": 'Tiger', "score": 15},
        {"text": 'Rabbit', "score": 5},
      ],
    },
    {
      'questionText': "What\'s is your favourite actor?",
      'answers': [
        {"text": "Salman", "score": 20},
        {"text": 'rithik', "score": 10},
        {"text": 'Tiger', "score": 15},
        {"text": 'Shahrukh', "score": 5},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var quest;

  String questionText;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
    print('Answer chosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // functiona automatically called by flutter

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    ); //scaffold for base design and ui
  }
}
