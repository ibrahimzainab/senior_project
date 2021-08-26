import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';
import 'package:senior_project/constants.dart';

class GardenNoteCard extends StatefulWidget {
  const GardenNoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  final Note note;

  @override
  _GardenNoteCardState createState() => _GardenNoteCardState();
}

class _GardenNoteCardState extends State<GardenNoteCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.1, 0, size.width * 0.1, size.height * 0.001),
      child: Container(
        margin: EdgeInsets.only(right: size.width * 0.02),
        decoration: BoxDecoration(
          // TODO: add elevation when extended
          color: Colors.grey,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width*0.03),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.54,
                      child: Text(
                        '${widget.note.title}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                        maxLines: 1,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.amber),
                        children: [
                          TextSpan(
                              text: '${widget.note.date}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    '${widget.note.text}',
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, letterSpacing: 1.0),
                    maxLines: 2,
                  ),
                ),
                if (widget.note.reminder)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                      ),
                      Icon(Icons.access_time)
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
