import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnswerPage extends StatefulWidget {
  AnswerPage({Key key}) : super(key: key);
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  String _answer = "";
  String _answer2 = "";
  bool _isAnswer = false;
  bool _isWin = false;

  void _guAnswer() {
    setState(() {
      _isAnswer = true;
      var rand = new math.Random();
      if (rand.nextInt(10) == 1) {
        _answer = "チョキ";
        _answer2 = "であなたの勝ちです";
        _isWin = true;
      } else {
        _answer = "パー";
        _answer2 = "であなたの負けです";
        _isWin = false;
      }
    });
  }

  void _chokiAnswer() {
    setState(() {
      _isAnswer = true;
      var rand = new math.Random();
      if (rand.nextInt(10) == 1) {
        _answer = "パー";
        _answer2 = "であなたの勝ちです";
        _isWin = true;
      } else {
        _answer = "グー";
        _answer2 = "であなたの負けです";
        _isWin = false;
      }
    });
  }

  void _paAnswer() {
    setState(() {
      _isAnswer = true;
      var rand = new math.Random();
      if (rand.nextInt(10) == 1) {
        _answer = "グー";
        _answer2 = "であなたの勝ちです";
        _isWin = true;
      } else {
        _answer = "チョキ";
        _answer2 = "であなたの負けです";
        _isWin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("じゃんけんページ"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _isAnswer ? answerWidget() :  notAnswerWidget()
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> notAnswerWidget() {

    return <Widget>[
      Text(
          "こげぱんの手は？？"
      ),
      Text(
        _answer,
      ),
      ElevatedButton(
        child: const Text('グー'),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        onPressed: _guAnswer,
      ),
      ElevatedButton(
        child: const Text('チョキ'),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        onPressed: _chokiAnswer,
      ),
      ElevatedButton(
        child: const Text('パー'),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        onPressed: _paAnswer,
      ),
    ];

  }


  List<Widget> answerWidget() {

    return <Widget>[
      Text(
          "こげぱんの手は？？"
      ),
      Text(
        _answer,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: _isWin ? Colors.red : Colors.blue,
        ),
      ),
      Text(
        _answer2,
      ),
      ElevatedButton(
        child: const Text('ホーム戻る'),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      )
    ];

  }
}