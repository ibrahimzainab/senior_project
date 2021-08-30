import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';
import 'package:senior_project/constants.dart';

bool obscureText = true;

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            obscureText: obscureText,
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon:IconButton(
                icon: Icon(Icons.visibility),
                color: kPrimaryColor,
                onPressed: (){
                  setState(() {
                    if(obscureText) obscureText = false;
                    else obscureText = true;
                  });
                },
              ),
              border: InputBorder.none,
              hintText: "Password",
            )));
  }
}
