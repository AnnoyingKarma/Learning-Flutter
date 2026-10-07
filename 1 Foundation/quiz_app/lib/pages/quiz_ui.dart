import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_class.dart';

class QuizUi extends StatefulWidget {
  const QuizUi({super.key});

  @override
  State<QuizUi> createState() => _QuizUiState();
}

class _QuizUiState extends State<QuizUi> {
  List<QuizData> quizList = [
    QuizData("Is Dart object-oriented", true),
    QuizData("Is Flutter a programming language?", false),
    QuizData("This question has any number?", false),
    QuizData("Is the sky Blue", true),
  ];
  int i = 0;
  int correctAns = 0;
  int wrongAns = 0;
  String isCorrect = "";
  void endPopup() {
    i==0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Over"),
          content: Text("Correct:$correctAns\nWrong:$wrongAns"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  i=0;
                  correctAns=0;
                  wrongAns=0;
                  isCorrect = "";
                });
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              color: Colors.lightBlue.shade50,
              child: Center(child: Text(quizList[i].question)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (quizList[i].answer == true) {
                      isCorrect = "✔️";
                      correctAns++;
                    } else {
                      isCorrect = "❌";
                      wrongAns++;
                    }
                    if (i>=quizList.length-1) {
                      endPopup();
                    }
                    else {i++;}
                  });
                },
                child: Text("True"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (quizList[i].answer == false) {
                      isCorrect = "✔️";
                      correctAns++;
                    } else {
                      isCorrect = "❌";
                      wrongAns++;
                    }
                    if (i >=quizList.length-1) {
                      endPopup();
                    }
                    else {i++;}
                  });
                },
                child: Text("False"),
              ),
            ],
          ),
          SizedBox(height: 100, child: Center(child: Text(isCorrect))),
        ],
      ),
    );
  }
}
