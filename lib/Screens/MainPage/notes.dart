import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';
import '../../constants.dart';
import 'components/noteCard.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 370,
            child: Row(
              children: <Widget>[
                Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Spacer(),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
          Divider(
            height: 30.0,
          ),
          // TODO: Add Plants List
          Container(
            height: 620,
            child: ListView.builder(
              itemCount: demoNotes.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                child: Dismissible(
                  key: Key(demoNotes[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoNotes.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: NoteCard(
                    note: demoNotes[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
