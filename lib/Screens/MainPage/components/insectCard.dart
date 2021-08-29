import 'package:flutter/material.dart';
import 'package:senior_project/Screens/MainPage/MyGarden/viewPlant.dart';
import 'package:senior_project/classes/insect.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/constants.dart';

class InsectCard extends StatefulWidget {
  const InsectCard({
    Key key,
    @required this.insect,
  }) : super(key: key);

  final Insect insect;

  @override
  _InsectCardState createState() => _InsectCardState();
}

class _InsectCardState extends State<InsectCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ViewInsect(
        //           insect: widget.insect,
        //         )));
      },
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
                        child: Hero(
                          tag: 'details-${widget.insect.id}',
                          child: Image.asset(
                              'assets/images/plant_grainy_illustration_alinashi.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '${widget.insect.name}',
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
