import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/components/plantCard.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/constants.dart';

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width*0.04, size.height*0.04, size.width*0.04, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'My Garden',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          ),
          Divider(
            height: size.height*0.03,
          ),
          // TODO: Add Plants List
          Container(
            height: size.height*0.8,
            child: ListView.builder(
              itemCount: demoGardenPlants.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,10.0),
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: PlantCard(plant: demoGardenPlants[index],),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
