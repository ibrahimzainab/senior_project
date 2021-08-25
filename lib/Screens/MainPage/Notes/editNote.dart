import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key key, @required this.note}) : super(key: key);

  final Note note;

  @override
  _EditNoteState createState() => _EditNoteState(note.title,note.text);
}


class _EditNoteState extends State<EditNote> {

  String initialTitle;
  var _titleController;
  String initialText;
  var _textController;

  _EditNoteState(title,text){
    initialTitle = title;
    _titleController = TextEditingController(text: initialTitle);
    initialText = text;
    _textController = TextEditingController(text: initialText);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _titleFocus = FocusNode();
    final _contentFocus = FocusNode();

    String initialText = widget.note.text;


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
          'Edit Note',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                if (_titleController.text != widget.note.title) {
                  widget.note.editTitle(_titleController.text);
                }
                if (_textController.text != widget.note.text) {
                  widget.note.editText(_textController.text);
                }
                Navigator.pop(context);
              }),
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
                child: EditableText(
                  onChanged: (value) {},
                  maxLines: null,
                  controller: _titleController,
                  focusNode: _titleFocus,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.blue,
                  backgroundCursorColor: Colors.blue,
                ),
              ),
            ),
            Divider(),
            Flexible(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: EditableText(
                    maxLines: 300,
                    // line limit extendable later
                    controller: _textController,
                    focusNode: _contentFocus,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    backgroundCursorColor: Colors.red,
                    cursorColor: Colors.blue,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
