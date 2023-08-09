import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/auth_provider.dart';
import 'package:quiz_app/providers/question_items.dart';
import 'package:quiz_app/screens/home.dart';
import 'package:quiz_app/screens/login.dart';
import 'package:quiz_app/screens/welcome.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarBrightness: Brightness.dark,
  ));

  await initialization(null);

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => QuizItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
          stream: _auth.authStateChanges(), // Listen to the user's login status
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator if the login state is not determined yet.
            } else {
              if (snapshot.hasData) {
                // User is logged in
                return HomeScreen();
              } else {
                // User is not logged in
                return WelcomeScreen();
              }
            }
          },
        ),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
