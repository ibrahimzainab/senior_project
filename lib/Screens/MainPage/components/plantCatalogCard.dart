import 'package:flutter/material.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/constants.dart';

class PlantCatalogCard extends StatefulWidget {
  const PlantCatalogCard({
    Key key,
    @required this.plant,
  }) : super(key: key);

  final SavedPlant plant;

  @override
  _PlantCatalogCardState createState() => _PlantCatalogCardState();
}

class _PlantCatalogCardState extends State<PlantCatalogCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              boxShadow: [kBoxShadow],
              color: Colors.white,
            ),
            height: size.height * 0.25,
            width: size.width * 0.4,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.3,
                    child: AspectRatio(
                      aspectRatio: 0.85,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //this child should be an image
                        child: Image.asset(
                            'assets/images/plant_grainy_illustration_alinashi.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '${widget.plant.plantName}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
