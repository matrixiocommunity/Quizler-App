import 'package:quizzler/main.dart';
import 'question.dart';

class QuizBrain {
  int _questiontracker = 0;
  List<Question> _questionBank = [
    // by adding underscore infront of _questionbank this will become private and can only acces by QuizBrain
    Question(
        questionText: '1.The beginning of universe is still a mystery',
        questionAnswer: true),
    Question(questionText: '2.we should not bath daily', questionAnswer: false),
    Question(
        questionText: '3.A true can\'t be false and a false can\'t be true',
        questionAnswer: true),
    Question(
        questionText: '4.Gumbling is illegal in India', questionAnswer: true),
    Question(questionText: '5.flutter eats lot of data', questionAnswer: true),
    Question(
        questionText: '6.In cricket 7 ball can be bowled in a over',
        questionAnswer: false),
    Question(questionText: '7.Newton born in India', questionAnswer: false),
    Question(
        questionText: '8.Newton gave three laws of motion',
        questionAnswer: true),
    Question(
        questionText: '9.int datatype can only contain integer ',
        questionAnswer: true),
    Question(questionText: '10.C language contain OOPs', questionAnswer: false),
  ];
  void nextquestion() {
    if (_questiontracker < _questionBank.length - 1) {
      _questiontracker++;
    }
  }

  // so as by adding _ our list became private so main.dart can't access directly
  // so we will create a fucntion and then main.dart will able to access it.
  String getquestion() {
    return _questionBank[_questiontracker].questionText;
  }

  bool getanswer() {
    return _questionBank[_questiontracker].questionAnswer;
  }

  bool isFinished() {
    if (_questiontracker == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    if (isFinished() == true) {
      _questiontracker = -1;
    }
  }
}
