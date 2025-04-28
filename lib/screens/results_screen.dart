import 'package:flutter/material.dart';
import 'package:quiz_app/components/questions_summary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'questions_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].correctAnswer,  // Utilisation de la méthode getter
        'user_answer': chosenAnswers[i],
        'all_answers': questions[i].answers,  // Toutes les réponses possibles
      });
    }
    return summaryData;
  }

  int getCorrectAnswersCount() {
    int correctAnswers = 0;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final numCorrectAnswers = getCorrectAnswersCount();
    final totalQuestions = questions.length;
    final summaryData = getSummaryData();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              icon: const Icon(Icons.restart_alt),
              onPressed: onRestart,
              label: const Text(
                'Restart Quiz !',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}