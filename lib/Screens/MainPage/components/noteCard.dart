import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({
    Key key,
    @required this.note,
  }) : super(key: key);

  final Note note;

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: size.width*0.7,
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
                    style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.amber),
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
              width: 370,
              child: Text(
                '${widget.note.text}',
                style: TextStyle(
                    color: Colors.black, fontSize: 16, letterSpacing: 1.0),
                maxLines: 2,
              ),
            ),
            if(widget.note.reminder)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width:size.width*0.8,
                  ),
                  Icon(Icons.access_time)
                ],
              ),
          ],
        ),
      ],
    );
  }
}
