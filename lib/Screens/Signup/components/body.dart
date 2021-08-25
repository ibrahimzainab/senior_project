import 'package:flutter/material.dart';
import 'package:senior_project/Screens/Login/components/textfieldcontainer.dart';
import 'package:senior_project/Screens/Signup/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

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
    List<String> spinnerItems = [
      'Aakkar',
      'Aaley',
      'Baabda',
      'Baalbeck',
      'Batroun',
      'Bcharreh',
      'Beirut',
      'Bent Jbail',
      'Chouf',
      'Hasbaya',
      'Hermel',
      'Jbeil',
      'Jezzine',
      'Keserwan',
      'Koura',
      'Nabatiyeh',
      'Matn',
      'Marjaayoun',
      'Minieh-Dannieh',
      'Rachaiya',
      'Saida',
      'Tripoli',
      'Tyr',
      'West Beqaa',
      'Zahle',
      'Zgharta'
    ];
    String dropdownValue = 'Beirut';

    return Background(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("SIGNUP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily:
                'senior_project/fonts/Atkinson_Hyperlegible/AtkinsonHyperlegible-Bold.tff',
            letterSpacing: 2,
          )),
      TextFieldContainer(
          child: TextField(
              decoration: InputDecoration(
        hintText: "Full Name",
        border: InputBorder.none,
      ))),
      TextFieldContainer(
          child: TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(
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
    ]));
  }
}
