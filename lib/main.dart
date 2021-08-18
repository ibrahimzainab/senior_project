import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Welcome/welcome_screen.dart';
import 'package:senior_project/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Project',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        
      ),
      home: WelcomeScreen(),
    );
  }
}

