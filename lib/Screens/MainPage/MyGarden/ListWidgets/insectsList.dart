import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/insectCard.dart';
import 'package:senior_project/classes/insect.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/services/plant.services.dart';

import '../../../../constants.dart';

PlantService _plantService = PlantService();
List<Insect> demoInsects = [];
List<Insect> filteredDemoInsects = [];

class InsectsListWidget extends StatefulWidget {
  const InsectsListWidget({Key key, @required this.plant,@required this.searchKeyWord}) : super(key: key);

  final String searchKeyWord;
  final Plant plant;

  @override
  _InsectsListWidgetState createState() => _InsectsListWidgetState();
}

class _InsectsListWidgetState extends State<InsectsListWidget> {

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      setState(() {
        filteredDemoInsects = demoInsects;
      });
    } else {
      setState(() {
        filteredDemoInsects = demoInsects
            .where((insect) =>
            insect.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      });
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

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
            _runFilter(widget.searchKeyWord);
            if (filteredDemoInsects.length == 0)
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
                itemCount: filteredDemoInsects.length,
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
                        insect: filteredDemoInsects[index],
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
