import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/gkQuiz.dart';
import 'package:quiz_app/screens/guessPicture.dart';
import 'package:quiz_app/screens/mathQuiz.dart';
import 'package:quiz_app/screens/stQuiz.dart';
import 'package:quiz_app/screens/welcome.dart';
import 'package:quiz_app/widgets/category_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? userName;
  int? userScore = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName');
      userScore = prefs.getInt('userScore');
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Color firstColor = HexColor('#fdeff9');
    Color secondColor = HexColor('#ec38bc');
    Color endColor = HexColor('#7303c0');

    final ap = Provider.of<AuthProvider>(context, listen: false);

    List<String> catNames = [
      'Guess the word',
      'General Knowledge',
      'Math',
      'Science & Technology'
    ];
    List<String> images = [
      'gtw.jpg',
      'GK.jpg',
      'math.png',
      'st.jpg',
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [firstColor, secondColor, endColor],
            // Define your gradient colors here
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.5,
              1,
            ],
            // Define gradient stops
            tileMode: TileMode.clamp,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi $userName',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/coin.png', height: 30, width: 30,),
                      Text(
                            '${userScore ?? 0}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      IconButton(onPressed: (){
                        ap.logout(context);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                      }, icon: Icon(Icons.logout))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Let's Play...",
                style: TextStyle(fontSize: width * 0.08, fontFamily: 'Borel'),
              ),
              Text(
                'Choose a category to start playing',
                style: TextStyle(fontSize: width * 0.05, fontFamily: 'Gotham'),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: 0.8,
                  mainAxisSpacing: 25,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CategoryGrid(
                    catName: catNames[index],
                    image: 'assets/images/category/${images[index]}',
                    index: index,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
