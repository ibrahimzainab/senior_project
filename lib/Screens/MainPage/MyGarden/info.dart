import 'package:flutter/material.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/constants.dart';

import 'categoryList.dart';

class Info extends StatefulWidget {
  const Info({Key key, @required this.plant}) : super(key: key);

  final Plant plant;

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  //TODO: error bl size
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.01),
              Container(
                margin: EdgeInsets.fromLTRB(size.width * 0.1,
                    size.height * 0.03, size.width * 0.1, size.height * 0.01),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CategoryList(plant: widget.plant),
            ],
          ),
        ),
      ),
    );
  }
}
