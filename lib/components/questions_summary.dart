import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: summaryData.map((data) {
                final isCorrect = data['user_answer'] == data['correct_answer'];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 50, 32, 100),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              ((data['questions_index'] as int) + 1).toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              data['question'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.only(left: 45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Affichage des réponses possibles
                            ...(data['all_answers'] as List<String>).map((answer) {
                              final isUserAnswer = answer == data['user_answer'];
                              final isCorrectAnswer = answer == data['correct_answer'];
                              
                              return Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: isCorrectAnswer
                                      ? const Color.fromARGB(255, 104, 172, 107)
                                      : isUserAnswer
                                          ? const Color.fromARGB(255, 238, 181, 230)
                                          : const Color.fromARGB(255, 50, 32, 100).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5),
                                  
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        answer,
                                        style: TextStyle(
                                          
                                        ),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}