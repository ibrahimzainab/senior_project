import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/components/plantCatalogCard.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/services/plant.services.dart';

PlantService _plantService = PlantService();
List<Plant> demoPlants = [];
List<Plant> filteredDemoPlants = [];

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      setState(() {
        filteredDemoPlants = demoPlants;
      });
    } else {
      setState(() {
        filteredDemoPlants = demoPlants
            .where((plant) =>
            plant.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      });
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

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
                    'Plants Catalog',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.03,
                  size.width * 0.1, size.height * 0.01),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value){_runFilter(value);},
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
            Expanded(
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                  ),
                ),
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
    if(demoPlants.isEmpty) {
      return FutureBuilder<List<Plant>>(
          future: _plantService
              .getAllPlants()
              .then((value) => demoPlants = value),
          builder: (context, AsyncSnapshot<List<Plant>> snapshot) {
            if (snapshot.hasData) {
              filteredDemoPlants=demoPlants;
              return GridView.builder(
                itemCount: demoPlants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                      child: PlantCatalogCard(
                        plant: demoPlants[index],
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
    else {
      if(filteredDemoPlants.isEmpty)
        return Center(
          child: Text(
            'No results found',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        );
      else
        return GridView.builder(
          itemCount: filteredDemoPlants.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) =>
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: PlantCatalogCard(
                  plant: filteredDemoPlants[index],
                ),
              ),
        );
    }
  }
}
