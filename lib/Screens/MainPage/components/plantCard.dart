import 'package:flutter/material.dart';

class PlantCard extends StatefulWidget {
  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
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
              child: Container(
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name1',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.amber),
                children: [
                  TextSpan(
                      text: '12/2/2021',
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
