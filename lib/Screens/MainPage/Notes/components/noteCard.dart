import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';
import 'package:senior_project/constants.dart';

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
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: kPrimaryColor.withOpacity(0.3),
          boxShadow: [kBoxShadow],
        ),
        height: size.height * 0.15,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.02, size.height * 0.01, 0, size.height * 0.01),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.65,
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
                                fontWeight: FontWeight.w600,
                                color: Colors.amber),
                            children: [
                              TextSpan(
                                  text: '${widget.note.date}',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    //(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.7,
                      child: Text(
                        '${widget.note.text}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 1.0),
                        maxLines: 3,
                      ),
                    ),
                    if (widget.note.reminder==1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: size.width * 0.7,
                          ),
                          Icon(Icons.access_time)
                        ],
                      ),
                  ],
                ),
              ],
            )));
  }
}
