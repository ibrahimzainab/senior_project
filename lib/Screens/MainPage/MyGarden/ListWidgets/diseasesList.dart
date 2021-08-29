import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/diseaseCard.dart';
import 'package:senior_project/classes/disease.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Plant> demoDiseases = [];

class DiseasesListWidget extends StatefulWidget {
  const DiseasesListWidget({
    Key key,
    @required this.plant
  }) : super(key: key);

  final Plant plant;

  @override
  _DiseasesListWidgetState createState() => _DiseasesListWidgetState();
}

class _DiseasesListWidgetState extends State<DiseasesListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Disease>>(
        future: _plantService
            .getAllPlants() // TODO: get all this plant's diseases
            .then((value) => demoDiseases = value),
        builder: (context, AsyncSnapshot<List<Disease>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: demoDiseases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: DiseaseCard(
                  disease: demoDiseases[index],
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