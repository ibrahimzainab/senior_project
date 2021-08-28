import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/catalog.dart';
import 'package:senior_project/Screens/MainPage/home.dart';
import 'package:senior_project/Screens/MainPage/garden.dart';
import 'package:senior_project/classes/user.dart';
import 'package:senior_project/constants.dart';
import 'Notes/notes.dart';
import 'articles.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user;
  int _currentIndex = 0;
  List<Widget> _bodyContent = [
    Home(),
    Garden(),
    Catalog(),
    Articles(),
    Notes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyContent[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: onIconTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.agriculture),
                label: 'Garden',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.wysiwyg),
                label: 'Articles',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.bug_report),
                label: 'Insects',
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Notes',
                backgroundColor: kPrimaryColor),
          ],
          unselectedItemColor: navBarUnselectedItemColor,
          selectedItemColor: navBarSelectedItemColor,
          showSelectedLabels: false,
        ),
      ),
    );
  }

  void onIconTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
