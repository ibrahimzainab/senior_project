import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';

class AddNote extends StatefulWidget {

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  Note note = Note(title: '', text: '',reminder: false,date: DateTime.now().toString().split(' ')[0]);
  var _titleController;
  var _textController;

  _AddNoteState() {
    _titleController = TextEditingController();
    _textController = TextEditingController();
  }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      final _titleFocus = FocusNode();
      final _contentFocus = FocusNode();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          title: Text(
            'Add Note',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            reminderWidget,
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                if(_titleController.text =='' || _textController.text =='') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Title and text can't be empty!"
                        ),
                      )
                  );
                }
                else {
                  // TODO:add note to db
                  note.title = _titleController.text;
                  note.text = _textController.text;
                  demoNotes.add(note);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.02, size.height * 0.03, size.width * 0.02, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    onSubmitted: (value) {},
                    maxLines: 1,
                    controller: _titleController,
                    focusNode: _titleFocus,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Divider(),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    maxLines: 300,
                    // line limit extendable later
                    controller: _textController,
                    focusNode: _contentFocus,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Content',
                      border: InputBorder.none,
                    ),
                    cursorColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      );;
  }

    Widget get reminderWidget{
      Color color;
      if(note.reminder)
        color = Colors.black;
      else color = Colors.grey;

      return IconButton(
        icon: Icon(
          Icons.access_time,
          color: color,
        ),
        onPressed: (){
          if(note.reminder==false){
            setState(() {
              note.reminder = true;
              // TODO: must set reminder time
            });
          }
          else
            setState(() {
              note.reminder = false;
            });
        },
      );
    }
}
