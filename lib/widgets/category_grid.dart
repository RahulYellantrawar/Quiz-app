import 'package:flutter/material.dart';
import 'package:quiz_app/screens/gkQuiz.dart';
import 'package:quiz_app/screens/guessPicture.dart';
import 'package:quiz_app/screens/mathQuiz.dart';
import 'package:quiz_app/screens/stQuiz.dart';

class CategoryGrid extends StatelessWidget {
  final String catName;
  final String image;
  final int index;

  const CategoryGrid({super.key, required this.catName, required this.image, required this.index,});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            if (index == 0) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuessTheWord()));
            } else if (index == 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GKQuiz()));
            } else if (index == 2) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MathQuiz()));
            } else if (index == 3) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScienceAndTechnology()));
            }
          },
          child: Card(
            elevation: 8,
            shadowColor: Colors.grey,
            child: Container(
              height: height * 0.2,
              width: width * 0.4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, fit: BoxFit.cover,),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            catName,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: width * 0.04),
          ),
        )
      ],
    );
  }
}
