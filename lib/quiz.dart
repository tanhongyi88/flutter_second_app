import 'package:flutter/material.dart';
import 'package:flutter_second_app/data/questions.dart';
import 'package:flutter_second_app/questions_screen.dart';
import 'package:flutter_second_app/results_screen.dart';
import 'package:flutter_second_app/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartPage(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length >= questions.length) {
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: onRestart);
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartPage(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 9, 142),
                Color.fromARGB(255, 147, 5, 229),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
