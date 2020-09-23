import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/Question.dart';
import 'Question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [];

  List<int> c = [];

  void checkAnswer(bool ans) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    int cc = c.length;

    //The user picked false.
    setState(() {
      int q = quizBrain.getQuestionNo();
      int l = quizBrain.getQuetionBankLength();

      if (q + 1 == l) {
        if (cc > 6) {
          Alert(
            context: context,
            type: AlertType.warning,
            title: "Quiz Ended",
            desc: " You were Good ! Follow Govt guidlines."
                " Thank You for answering chaitanya's quiz",
            buttons: [
              DialogButton(
                child: Text(
                  "Start Again",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
              DialogButton(
                child: Text(
                  "Exit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => SystemNavigator.pop(),
                width: 120,
              )
            ],
          ).show();
        } else {
          Alert(
            context: context,
            type: AlertType.warning,
            title: "Quiz Ended",
            desc:
                " Your score was less so you need to know more ! Follow Govt guidlines."
                "Thank You for answering chaitanya's quiz",
            buttons: [
              DialogButton(
                child: Text(
                  "Start Again",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
              DialogButton(
                child: Text(
                  "Exit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => SystemNavigator.pop(),
                width: 120,
              )
            ],
          ).show();
        }

        quizBrain.starting();
        scorekeeper.clear();
        c.clear();
      } else {
        if (ans == correctAnswer) {
          c.add(1);
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
One infected person infects about 2.5 other people. true
Patients with COVID-19 can take anti-inflammatory medicine like ibuprofen, aspirin or naproxen. true
Once infected with the coronavirus, it can take 2 to 14 days to show symptoms. true
Hand sanitizer doesn’t kill coronavirus because it’s antibacterial, not antiviral. false
Healthy people should practice social distancing. true
During a shelter-in-place order, my kids can be with other kids in small groups. false
Anyone with COVID-19 symptoms, regardless of their overall health, should seek testing. false
A loss of smell or taste is a symptom of COVID-19. true
If you can hold your breath for 10 seconds, you don’t have COVID-19. false
*/
