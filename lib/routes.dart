import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/main_page.dart';
import 'package:senior_project/Screens/Login/login_screen.dart';
import 'package:senior_project/Screens/Welcome/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/mainPage': (context) => MainPage(),
  '/login': (context) => LoginScreen(),
  '/welcome': (context) => WelcomeScreen(),
};