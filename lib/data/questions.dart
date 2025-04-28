import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion('What is Flutter ?',
    [
      'A programming language',
      'A database',
      'A UI toolkit',
      'A game engine',
    ],
    2,
  ),
  QuizQuestion('What language does Flutter use ?',
    [
      'JavaScript',
      'Python',
      'Java',
      'Dart',
    ],
    3,
  ),
  QuizQuestion('What is a widget in Flutter ?',
    [
      'A visual element language',
      'A database connection',
      'A programming language',
      'A user input field',
    ],
    0,
  ),
  QuizQuestion('who developed Flutter ?',
    [
      'Microsoft',
      'Google',
      'Facebook',
      'Apple',
    ],
    1,
  ),
];