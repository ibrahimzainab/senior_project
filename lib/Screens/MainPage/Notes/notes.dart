import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senior_project/Screens/MainPage/Notes/editNote.dart';
import 'package:senior_project/classes/note.dart';
import 'package:senior_project/services/plant.services.dart';
import '../../../constants.dart';
import 'addNote.dart';
import 'components/noteCard.dart';

PlantService _plantService = PlantService();
List<Note> demoNotes = [];

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.04, size.height * 0.04, size.width * 0.04, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: size.width,
            child: Row(
              children: <Widget>[
                Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                // Spacer(),
                // IconButton(
                //     icon: Icon(Icons.add),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => AddNote()));
                //     }),
              ],
            ),
          ),
          Divider(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.8,
            child: NotesListWidget(),
          ),
        ],
      ),
    );
  }
}

class NotesListWidget extends StatefulWidget {

  @override
  _NotesListWidgetState createState() => _NotesListWidgetState();
}

class _NotesListWidgetState extends State<NotesListWidget> {
  int change =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<Note>>(
        future:
        _plantService.getAllNotes().then((value) => demoNotes = value),
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasData) {
            if(demoNotes.isEmpty)
              return Center(
                child: Text(
                  'No added notes.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              );
            return ListView.builder(
              itemCount: demoNotes.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditNote(
                              note: demoNotes[index],
                            )));
                    setState(() {
                      change++;
                    });
                  },
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
}
