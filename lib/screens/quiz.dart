import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/startScreen.dart';

class Quiz extends StatefulWidget { 
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState(); 
}

class _QuizState extends State<Quiz> { 
  List<String> selectedAnswers = []; 
  var activeScreen = 'start-screen';

  void switchScreen() { 
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

 void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        
        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [] ;
      activeScreen = 'questions-screen' ;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = startScreen(switchScreen); 
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart:restartQuiz ,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 166, 135, 219),
                Color.fromARGB(255, 53, 37, 96),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
