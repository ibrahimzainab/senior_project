import 'package:flutter/material.dart';

class Plant{
  int id;
  String name,family,description,image;
  List<String> takingCare,howToPlant;
  List<DateTime>watering;
  //List<Insect> insects;
  // List<Article> articles;
  //List<Disease> diseases;

  Plant({
    @required this.id,
    @required this.name,
    @required this.family,
    @required this.description,
    this.image,
    @required this.watering,
    @required this.takingCare,
    @required this.howToPlant,
    //this.insects,
    //this.diseases,
    //this.articles,
  });
}

List<Plant> demoPlants = [
  Plant(id: 1,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 2,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 3,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
];