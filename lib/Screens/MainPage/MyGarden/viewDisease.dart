import 'package:flutter/material.dart';
import 'package:senior_project/classes/disease.dart';

import '../../../constants.dart';

class ViewDisease extends StatefulWidget {
  const ViewDisease({
    Key key,
    @required this.disease
  }) : super(key: key);

  final Disease disease;

  @override
  _ViewDiseaseState createState() => _ViewDiseaseState();
}

class _ViewDiseaseState extends State<ViewDisease> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            size.width * 0.03, size.height * 0.04, size.width * 0.03, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: 'details-${widget.disease.id}',
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage: AssetImage(
                        'assets/images/plant_grainy_illustration_alinashi.png'),
                    //AssetImage(widget.plant.image),
                    radius: size.height * 0.15,
                  ),
                ),
              ),
              Divider(
                height: size.height * 0.05,
              ),
              Center(
                child: Text(
                  widget.disease.name,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                widget.disease.description,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'What to do:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * widget.disease.whatToDo.length * 0.03,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.disease.whatToDo.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01),
                    child: Row(
                      children: [
                        Text(
                          "${index + 1}. ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.disease.whatToDo[index]}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
