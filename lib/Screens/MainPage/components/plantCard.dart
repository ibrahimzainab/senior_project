import 'package:flutter/material.dart';
import 'package:senior_project/classes/plant.dart';

class PlantCard extends StatefulWidget {
  const PlantCard({
    Key key,
    @required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              //this child should be an image
              child: Image.asset(
                  'assets/images/plant_grainy_illustration_alinashi.png'),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width*0.54,
              child: Text(
                '${widget.plant.addedName}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${widget.plant.plantName}',
              style: TextStyle(
                  color: Colors.black, fontSize: 16, letterSpacing: 1.0),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.amber),
                children: [
                  TextSpan(
                      text: '${widget.plant.date}',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {
            // TODO: Extend card when pressed
          },
        ),
      ],
    );
  }
}
