import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/already_have_an_account_check.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';
import 'package:senior_project/Screens/MainPage/home.dart';
import 'package:senior_project/Screens/MainPage/main_page.dart';
import 'package:senior_project/Screens/Register/components/background.dart';
import 'package:senior_project/Screens/Register/components/roundedinputfield.dart';
import 'package:senior_project/Screens/Register/components/roundedpasswordfield.dart';
import 'package:senior_project/Screens/Welcome/components/roundedbutton.dart';
import 'package:senior_project/classes/user.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/services/auth.service.dart';

String dropdownValue = 'Beirut';
AuthService _authService = AuthService();

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final dateController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final majorController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final regionController = TextEditingController();
  final passwordController = TextEditingController();

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
            onChanged: (value) {},
            textEditingController: usernameController,
          ),
          RoundedInputField(
            icon: Icons.person,
            hintText: "Name",
            onChanged: (value) {},
            textEditingController: nameController,
          ),
          TextFieldContainer(
              child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range, color: kPrimaryColor),
                    hintText: 'Birth Date',
                    border: InputBorder.none,
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));
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
            ),
            controller: majorController,
          )),
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
            onChanged: (value) {},
            textEditingController: emailController,
          ),
          RoundedInputField(
            icon: Icons.phone_android,
            hintText: "Phone Number (Optional)",
            onChanged: (value) {},
            textEditingController: phoneController,
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            controller: passwordController,
          ),
          RoundedButton(
              text: "SIGN UP",
              press: () async {
                User user = await _authService.register(
                    nameController.text.trim().toString(),
                    usernameController.text.trim().toString(),
                    passwordController.text.trim().toString(),
                    dateController.text.toString(),
                    emailController.text.trim().toString(),
                    phoneController.text.trim().toString(),
                    dropdownValue,
                    majorController.text.trim().toString().toLowerCase());
                if (user != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                } else {}
              }),
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
