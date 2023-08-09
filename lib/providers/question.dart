import 'package:flutter/cupertino.dart';

class Question with ChangeNotifier {
  String question;
  String image;
  List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.question,
    required this.image,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option with ChangeNotifier {
  String text;
  bool isCorrect;

  Option({
    required this.text,
    required this.isCorrect,
});
}
