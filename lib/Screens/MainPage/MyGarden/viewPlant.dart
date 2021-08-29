import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/classes/plant.dart';

import 'info.dart';

class ViewPlant extends StatefulWidget {
  const ViewPlant({Key key, @required this.plant}) : super(key: key);

  final Plant plant;

  @override
  _ViewPlantState createState() => _ViewPlantState();
}

class _ViewPlantState extends State<ViewPlant> {

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add name'),
                  content: ListBody(
                      children: <Widget>[
                        Text('Add  a name to your new plant.'),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ],
                    ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Confirm'),
                      onPressed: () {
                        if(_controller.text!='') {
                          // TODO: add plant to garden
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Plant added to my garden!"
                                ),
                              )
                          );
                          Navigator.of(context).pop();
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Name can't be empty!"
                                ),
                              )
                          );
                        }

                      },
                    ),
                  ],
                );
              },
            );},
          ),
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Info()));
            },
          ),
        ],
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
                  tag: 'details-${widget.plant.id}',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/plant_grainy_illustration_alinashi.png'),
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
                  widget.plant.name,
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
                widget.plant.description,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'How to plant it:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              SizedBox(
                height: size.height * widget.plant.howToPlant.length * 0.03,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.plant.howToPlant.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01),
                    child: Row(
                      children: [
                        Text(
                          "${index+1}. ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.plant.howToPlant[index]}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.01,
              ),
              Text(
                'Tips:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              SizedBox(
                height: size.height * widget.plant.takingCare.length * 0.03,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.plant.takingCare.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.01),
                    child: Row(
                      children: [
                        Text(
                          "${index+1}. ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.plant.takingCare[index]}",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
