import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/already_have_an_account_check.dart';
import 'package:senior_project/Screens/Register/components/background.dart';
import 'package:senior_project/Screens/Register/components/roundedinputfield.dart';
import 'package:senior_project/Screens/Register/components/roundedpasswordfield.dart';
import 'package:senior_project/Screens/Register/components/roundedrepeatpasswordfield.dart';
import 'package:senior_project/Screens/Welcome/components/roundedbutton.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily:
                  'senior_project/fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.tff',
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
              icon: Icons.person,
              hintText: "First Name",
              onChanged: (value) {}),
          RoundedInputField(
              icon: Icons.person,
              hintText: "Last Name",
              onChanged: (value) {}),
          RoundedInputField(
              icon: Icons.alternate_email,
              hintText: "Your Email",
              onChanged: (value) {}),
          RoundedInputField(
              icon: Icons.phone_android,
              hintText: "Your Phone Number",
              onChanged: (value) {}),
          RoundedPasswordField(onChanged: (value) {}),
          RoundedRepeatPasswordField(onChanged: (value) {}),
          RoundedButton(text: "SIGN UP", press: () {}),
          SizedBox(height: size.height * 0.02),
          AlreadyHaveAnAccountCheck(
            press: () {},
            login: false,
          )
        ],
      )),
    );
  }
}
