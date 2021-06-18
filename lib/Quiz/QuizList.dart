class QuizList{
  int _questionNum = 0;

  List<String> _questionBank = [
    "What do you know about rolling down on the deep?",
    "what your name?",
    "what do you learn from us?",
    "do you smile?",
    "what is wrong with you dude?"
  ];

  void nextQuestion(){
    if(_questionNum < _questionBank.length - 1){
      _questionNum++;
    }
  }

  int getQuestionNumber(){
    return _questionNum+1;
  }
  void isReset(){
    _questionNum = 0;
  }

  String getQuestionText(){
    return _questionBank[_questionNum];
  }

  int getQuestionLength(){
    return _questionBank.length;
  }
}