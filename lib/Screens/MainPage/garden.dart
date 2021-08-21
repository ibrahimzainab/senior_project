import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/components/plantCard.dart';
import 'package:senior_project/constants.dart';

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Dismissible(
              key: Key('key'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  // remove from database
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.delete),
                  ],
                ),
              ),
              child: PlantCard(),
            ),
          ],
        ),
      ),
    );
  }
}
