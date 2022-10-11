class Question {
  late String questionText;
  late bool questionAnswer;

  Question({required this.questionText, required this.questionAnswer});
}

/*
NOTE: we can also use this code bt above code is less time consuming and shorter than it so it is better to use above code 
class Question {
  late String questionText;
  late bool questionAnswer;

  Question({required String q, required bool a}){
    questionText=q;
    questionAnswer=a;
  }
}
 */
