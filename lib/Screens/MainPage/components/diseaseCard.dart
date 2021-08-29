import 'package:flutter/material.dart';
import 'package:senior_project/classes/disease.dart';

import '../../../constants.dart';

class DiseaseCard extends StatefulWidget {
  const DiseaseCard({
    Key key,
    @required this.disease,
  }) : super(key: key);

  final Disease disease;

  @override
  _DiseaseCardState createState() => _DiseaseCardState();
}

class _DiseaseCardState extends State<DiseaseCard> {
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
                          tag: 'details-${widget.disease.id}',
                          child: Image.asset(
                              'assets/images/plant_grainy_illustration_alinashi.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '${widget.disease.name}',
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
