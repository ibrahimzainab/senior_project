import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily:
                'senior_project/fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.tff',
          ),
        ),
        Image.asset('assets/icons/Plant - 2.png', height: size.height * 0.35),
      ],
    ));
  }
}
