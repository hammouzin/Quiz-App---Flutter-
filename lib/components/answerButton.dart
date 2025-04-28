import 'package:flutter/material.dart';

class answerButton extends StatelessWidget {
  const answerButton({
    required this.text,
    required this.onTap,
    this.style,
    super.key});

  final String text ; 
  final void Function() onTap ;
  final ButtonStyle? style;

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: style,
       child: Text(text));
  }
}