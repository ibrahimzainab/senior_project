import 'package:flutter/material.dart';

import 'package:senior_project/Screens/Login/login_screen.dart';
import 'package:senior_project/Screens/Welcome/components/background.dart';
import 'package:senior_project/Screens/Welcome/components/roundedbutton.dart';
import 'package:senior_project/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME TO XXXX",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      'senior_project/fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.tff',
                  letterSpacing: 2)),
          SizedBox(height: size.height * 0.03),
          Image.asset('assets/icons/Plant - 1.webp',
              height: size.height * 0.45),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: "LOGIN",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
          RoundedButton(
              text: "SIGN UP",
              press: () {},
              color: kPrimaryLightColor,
              textColor: Colors.black),
        ],
      ),
    );
  }
}
