import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/insectCard.dart';
import 'package:senior_project/classes/insect.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Insect> demoInsects = [];

class InsectsListWidget extends StatefulWidget {
  const InsectsListWidget({Key key, @required this.plant}) : super(key: key);

  final Plant plant;

  @override
  _InsectsListWidgetState createState() => _InsectsListWidgetState();
}

class _InsectsListWidgetState extends State<InsectsListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder<List<Insect>>(
        future: _plantService
            .getRelatedInsects(widget.plant.id)
            .then((value) => demoInsects = value),
        builder: (context, AsyncSnapshot<List<Insect>> snapshot) {
          if (snapshot.hasData) {
            if (demoInsects.length == 0)
              return Center(
                child: Text(
                  'No related insects.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              );
            else
              return GridView.builder(
                itemCount: demoInsects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: InsectCard(
                        insect: demoInsects[index],
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
