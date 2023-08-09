import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/widgets/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/question_items.dart';
import 'home.dart';

class ScienceAndTechnology extends StatefulWidget {
  const ScienceAndTechnology({super.key});

  @override
  State<ScienceAndTechnology> createState() => _ScienceAndTechnologyState();
}

class _ScienceAndTechnologyState extends State<ScienceAndTechnology> {
  final _controller = PageController();
  int _questionNumber = 1;
  int _score = 0;
  int _userScore = 0;
  final CountDownController _controllerTimer = CountDownController();
  late AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadScore();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the AudioPlayer instance
    super.dispose();
  }

  void _loadScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userScore = prefs.getInt('userScore')!;
    });
  }

  void _incrementScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int updatedScore =
        _score + _userScore; // You can adjust how the score is updated
    prefs.setInt('userScore', updatedScore);
    setState(() {
      _score = updatedScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final qItems = Provider.of<QuizItems>(context);

    void resetQuestions() {
      setState(() {
        for (var question in qItems.scienceItems) {
          question.isLocked = false;
          question.selectedOption = null;
        }
      });
    }

    Color firstColor = HexColor('#D7DDE8');
    Color secondColor = HexColor('#757F9A');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [firstColor, secondColor],
            // Define your gradient colors here
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1],
            // Define gradient stops
            tileMode: TileMode.clamp,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _questionNumber = index + 1;
                    });
                  },
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    final question = qItems.scienceItems[index];
                    return Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _audioPlayer.pause();
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                              CircularCountDownTimer(
                                onStart: () {
                                  _audioPlayer.play(AssetSource('audio/Timer.mp3'));
                                },
                                initialDuration: 0,
                                controller: _controllerTimer,
                                width: 40,
                                height: 40,
                                strokeWidth: 5,
                                duration: 15,
                                fillColor: Colors.red,
                                ringColor: Colors.green,
                                strokeCap: StrokeCap.round,
                                textStyle: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                isReverse: true,
                                autoStart: true,
                                onComplete: () {
                                  if (_questionNumber <
                                      qItems.guessItems.length) {
                                    _controller.nextPage(
                                      duration:
                                      const Duration(milliseconds: 250),
                                      curve: Curves.easeInExpo,
                                    );
                                    setState(() {
                                      _questionNumber++;
                                      // _isTimerExpired = false;
                                    });
                                  }
                                },
                              ),
                              Text(
                                'Q. $_questionNumber/10',
                                style: const TextStyle(
                                    fontSize: 20, fontFamily: 'Gotham'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        QuestionWithOptions(
                          question: question,
                          onTap: (option) {
                            _controllerTimer.pause();
                            if (question.isLocked) {
                              return;
                            } else {
                              setState(() {
                                question.isLocked = true;
                                question.selectedOption = option;
                              });
                              if (question.selectedOption!.isCorrect) {
                                _score = _score + 10;
                                _audioPlayer.play(AssetSource('audio/correct.mp3'));
                              } else {
                                _audioPlayer.play(AssetSource('audio/wrong.mp3'));
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _questionNumber == 10
                            ? ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    alignment: Alignment.center,
                                    children: [
                                      const Text(
                                        'Your Score',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '$_score',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'Gotham',
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushNamed(
                                                HomeScreen.routeName);
                                            setState(() {
                                              _incrementScore();
                                            });
                                            resetQuestions();
                                          },
                                          child: const Text('Go to home'))
                                    ],
                                  );
                                });
                          },
                          child: const Text('Show Results'),
                        )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
