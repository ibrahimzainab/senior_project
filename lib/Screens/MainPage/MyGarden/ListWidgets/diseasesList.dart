import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/diseaseCard.dart';
import 'package:senior_project/classes/disease.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Disease> demoDiseases = [];
List<Disease> filteredDemoDiseases = [];

class DiseasesListWidget extends StatefulWidget {
  const DiseasesListWidget({Key key, @required this.plant,@required this.searchKeyWord}) : super(key: key);

  final String searchKeyWord;
  final Plant plant;

  @override
  _DiseasesListWidgetState createState() => _DiseasesListWidgetState();
}

class _DiseasesListWidgetState extends State<DiseasesListWidget> {

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      setState(() {
        filteredDemoDiseases = demoDiseases;
      });
    } else {
      setState(() {
        filteredDemoDiseases = demoDiseases
            .where((disease) =>
            disease.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      });
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Disease>>(
        future: _plantService
            .getRelatedDiseases(widget.plant.id)
            .then((value) => demoDiseases = value),
        builder: (context, AsyncSnapshot<List<Disease>> snapshot) {
          if (snapshot.hasData) {
            _runFilter(widget.searchKeyWord);
            if (filteredDemoDiseases.length == 0)
              return Center(
                child: Text(
                  'No related diseases.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              );
            else
            return GridView.builder(
              itemCount: filteredDemoDiseases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: DiseaseCard(
                  disease: filteredDemoDiseases[index],
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
