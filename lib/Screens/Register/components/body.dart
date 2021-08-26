import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/already_have_an_account_check.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';
import 'package:senior_project/Screens/Register/components/background.dart';
import 'package:senior_project/Screens/Register/components/roundedinputfield.dart';
import 'package:senior_project/Screens/Register/components/roundedpasswordfield.dart';
import 'package:senior_project/Screens/Welcome/components/roundedbutton.dart';
import 'package:senior_project/constants.dart';

String dropdownValue = 'Beirut';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final dateController = TextEditingController();

  void dispose() {
    dateController.dispose();
    super.dispose();
  }

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
              hintText: "Username",
              onChanged: (value) {}),
          TextFieldContainer(
              child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range, color : kPrimaryColor),
                    hintText: 'Birth Date',
                    border: InputBorder.none,
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2021));
                    if (date != null)
                      dateController.text =
                          date.toLocal().toString().substring(0, 10);
                  })),
          TextFieldContainer(
              child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.work, color: kPrimaryColor),
                    hintText: "Major",
                    border: InputBorder.none,
                  ))),
          TextFieldContainer(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              value: dropdownValue,
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          RoundedInputField(
              icon: Icons.alternate_email,
              hintText: "Email (Optional)",
              onChanged: (value) {}),
          RoundedInputField(
              icon: Icons.phone_android,
              hintText: "Phone Number (Optional)",
              onChanged: (value) {}),
          RoundedPasswordField(onChanged: (value) {}),
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
