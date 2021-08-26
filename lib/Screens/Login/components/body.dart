import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/already_have_an_account_check.dart';
import 'package:senior_project/Screens/Login/components/background.dart';
import 'package:senior_project/Screens/Login/components/roundedinputfield.dart';
import 'package:senior_project/Screens/Login/components/roundedpasswordfield.dart';
import 'package:senior_project/Screens/Register/register_screen.dart';
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
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily:
                  'senior_project/fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.tff',
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Image.asset('assets/icons/Plant - 2.png', height: size.height * 0.35),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
              icon: Icons.person,
              hintText: "Your Email/ Phone Number",
              onChanged: (value) {}),
          RoundedPasswordField(onChanged: (value) {}),
          RoundedButton(text: "LOGIN", press: () {}),
          SizedBox(height: size.height * 0.02),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisterScreen();
              }));
            },
            login: true,
          )
        ],
      )),
    );
  }
}
