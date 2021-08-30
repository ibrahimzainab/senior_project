import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/plantCard.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/classes/user.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/services/plant.services.dart';

PlantService _plantService = PlantService();
List<SavedPlant> demoGardenPlants = [];
User user = User.user;

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  Widget build(BuildContext context) {
    print(user.id);
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
                ListWidget(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<SavedPlant>>(
        future: _plantService
            .getAllSavedPlants(user.id)
            .then((value) => demoGardenPlants = value),
        builder: (context, AsyncSnapshot<List<SavedPlant>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: demoGardenPlants.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: Dismissible(
                  key: Key(demoGardenPlants[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                    bool result = await _plantService
                        .deleteSavedPlant(demoGardenPlants[index].id);
                    if (result == true) {
                      setState(() {
                        demoGardenPlants.removeAt(index);
                      });
                    }
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
            );
          } else {
            return SizedBox(
                width: size.width,
                child: SpinKitThreeBounce(
                  color: kPrimaryColor,
                  size: 30.0,
                ));
          }
        });
  }
}
