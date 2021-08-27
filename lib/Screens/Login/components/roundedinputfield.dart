import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';
import 'package:senior_project/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            obscureText: false,
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: kPrimaryColor,
              ),
              hintText: hintText,
              border: InputBorder.none,
            )));
  }
}
