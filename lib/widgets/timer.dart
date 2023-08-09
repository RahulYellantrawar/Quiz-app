import 'dart:async';
import 'package:flutter/material.dart';

class QuizTimer extends StatefulWidget {
  final int durationInSeconds;
  final VoidCallback onTimerExpired;

  QuizTimer({required this.durationInSeconds, required this.onTimerExpired});

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  late Timer _timer;
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.durationInSeconds;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          widget.onTimerExpired();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Time: $_remainingTime seconds');
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
