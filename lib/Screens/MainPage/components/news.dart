import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';

class News extends StatefulWidget {

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
        ),
      ),
      body: Center(
        child: Text(
          'No news available at the moment.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15
          ),
        )
      ),
    );
  }
}
