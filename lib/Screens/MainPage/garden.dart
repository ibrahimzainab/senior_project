import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/components/plantCard.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/constants.dart';

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Garden',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          Divider(
            height: 30.0,
          ),
          // TODO: Add Plants List
          Container(
            height: 620,
            child: ListView.builder(
              itemCount: demoPlants.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,10.0),
                child: Dismissible(
                  key: Key(demoPlants[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoPlants.removeAt(index);
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
                  child: PlantCard(plant: demoPlants[index],),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
