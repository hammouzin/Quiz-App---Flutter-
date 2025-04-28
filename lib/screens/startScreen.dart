import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  const startScreen(this.startQuiz,{super.key});
   final void Function() startQuiz ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png',
          width: 300,
          ),
          const SizedBox(height: 80),
          const Text('Welcome To Exam App', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon:const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: startQuiz,
             label: const Text('Start Quiz'),
    
             ),
        ],
      ),
    );
  }
}