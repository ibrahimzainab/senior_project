import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/main_page.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      initialRoute: '/welcome',
      routes: routes,
    );
  }

}
