import 'Question.dart';

class QuizBrain {
  int _questionNo = 0;

  // ignore: non_constant_identifier_names
  List<Question> _QuestionBank = [
    Question('1.One infected person infects about 2.5 other people ?', true),
    Question(
        '2.Patients with COVID-19 can take anti-inflammatory medicine like ibuprofen, aspirin or naproxen ?',
        true),
    Question(
        '3.Once infected with the coronavirus, it can take 2 to 14 days to show symptoms ?',
        true),
    Question(
        '4.Hand sanitizer doesn’t kill coronavirus because it’s antibacterial, not antiviral ?',
        false),
    Question('5.Healthy people should practice social distancing ?', true),
    Question(
        '6.During a shelter-in-place order, my kids can be with other kids in small groups ?',
        false),
    Question(
        '7.Anyone with COVID-19 symptoms, regardless of their overall health, should seek testing ?',
        false),
    Question('8.A loss of smell or taste is a symptom of COVID-19 ?', true),
    Question(
        '9.If you can hold your breath for 10 seconds, you don’t have COVID-19 ?',
        false),
    Question(
        '10.Eating meat increases your risk of contracting COVID-19 ?', false),
  ];

  void nextQuestion() {
    if (_questionNo < _QuestionBank.length - 1) {
      _questionNo++;
    }
  }

  String getQuestionText() {
    return _QuestionBank[_questionNo].questionText;
  }

  bool getCorrectAnswer() {
    return _QuestionBank[_questionNo].questionAnswer;
  }

  int getQuestionNo() {
    return _questionNo;
  }

  int getQuetionBankLength() {
    return _QuestionBank.length;
  }

  void starting() {
    _questionNo = -1;
  }
}
