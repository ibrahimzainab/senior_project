import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/components/plantCard.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/constants.dart';
import 'viewPlant.dart';

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, size.height * 0.05, 0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.05, 0, size.width * 0.03, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    'My Garden',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {}),
                ],
              ),
            ),
            Divider(
              height: size.height * 0.05,
            ),
            // TODO: Add Plants List
            Expanded(
              child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    )),
                ListView.builder(
                  itemCount: demoGardenPlants.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                    child: Dismissible(
                        key: Key(demoGardenPlants[index].id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            demoGardenPlants.removeAt(index);
                          });
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(Icons.delete),
                            ],
                          ),
                        ),
                        child: PlantCard(
                          plant: demoGardenPlants[index],
                        ),
                      ),
                    ),
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
