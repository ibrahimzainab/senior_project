import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Welcome/components/roundedbutton.dart';

import '../../../constants.dart';

class SuggestionForm extends StatefulWidget {
  @override
  _SuggestionFormState createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Form'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(size.width*0.1, size.height*0.1, size.width*0.1, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(5),
                child: TextField(
                  onSubmitted: (value) {},
                  maxLines: 1,
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
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.blue,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextButton(
                  child: Text('Send', style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2.0),),
                  onPressed: (){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    content: Text("Form sent!"),
                  ));
                  Navigator.of(context).pop();
                },),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
