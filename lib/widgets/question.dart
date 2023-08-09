import 'package:flutter/material.dart';
import 'package:quiz_app/providers/question.dart';

class QuestionWithOptions extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onTap;

  const QuestionWithOptions({super.key, required this.question, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/${question.image}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Text(
              question.question,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Column(
            children: question.options
                .map(
                  (option) => GestureDetector(
                    onTap: () => onTap(option),
                    child: Container(
                      height: height * 0.065,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: getColorForOption(option, question)),
                        color: getColorForOption(option, question),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            option.text,
                            style: const TextStyle(fontSize: 20),
                          ),
                          getIconForOption(option, question),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(
                Icons.check_circle,
                color: Colors.white,
              )
            : const Icon(
                Icons.cancel,
                color: Colors.white,
              );
      } else if (option.isCorrect) {
        return const Icon(
          Icons.check_circle,
          color: Colors.white,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
