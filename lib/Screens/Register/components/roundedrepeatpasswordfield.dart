import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Register/components/textfieldcontainer.dart';
import 'package:senior_project/constants.dart';

class RoundedRepeatPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedRepeatPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon:
              Icon(Icons.visibility, color: kPrimaryColor, size: 22),
              border: InputBorder.none,
              hintText: "Repeat Password",
            )));
  }
}
