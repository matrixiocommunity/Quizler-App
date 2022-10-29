import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(quizzler());
QuizBrain quizBrain = QuizBrain();

class quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.0),
            child: quizpage(),
          ),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  int score = 0;
  List<Icon> scorekeeper = [];
  void scoreanswer(bool useranswer) {
    bool correctanswer = quizBrain.getanswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the quiz.\n Press CANCEL to reset the Quiz\nYour score:',
        ).show();
        quizBrain.reset();
        scorekeeper = [];
        score = 0;
      } else {
        if (correctanswer == useranswer) {
          score++;
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }

      quizBrain.nextquestion();
    });
  }
  // we can made our check and display question and answer by this method also if we don't use question class
  // List<String> questions = [
  //   'The beginning of universe is still a mystery',
  //   'we should not bath daily',
  //   'A true can\'t be false and a false can\'t be true',
  // ];
  // List<bool> checkanswer = [true, false, true];
  // In the list we are using constructor which made in question class in question.dart file

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'score:$score',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.green, fontSize: 19),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // quizBrain.questionBank[questiontracker].questionText,
                // above line will be used if we don't make our QuizBrain list private
                quizBrain.getquestion(),

                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                scoreanswer(true);
              },
              // color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                scoreanswer(false);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}
