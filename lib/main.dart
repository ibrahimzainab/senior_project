import 'package:flutter/material.dart';
import 'package:senior_project/classes/sharedpref.dart';
import 'package:senior_project/classes/user.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  SharedPref sharedPref = SharedPref();

  Future<String> loadSharedPrefs() async {
    var list = await sharedPref.read("user");
    if (list != null) {
      User(list);
      return "/mainPage";
    } else
      return "/welcome";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Project',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: "/welcome",
      routes: routes,
    );
  }
}
