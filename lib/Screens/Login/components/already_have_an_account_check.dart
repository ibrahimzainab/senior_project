import 'package:flutter/material.dart';
import 'package:senior_project/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({Key key, this.login, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account?" : "Already have an Account?",
          style: TextStyle(color: kPrimaryColor),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: press,
          child: Text(login ? "Sign up" : "Sign in",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}
