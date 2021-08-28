//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Plant {
  int id;
  String name, family, description, image;
  List<String> takingCare, howToPlant;
  int wateringScheduleId;

  Plant({
    @required this.id,
    @required this.name,
    @required this.family,
    @required this.description,
    @required this.image,
    @required this.wateringScheduleId,
    @required this.takingCare,
    @required this.howToPlant,
  });

  // hon mnkhalle l watering bas l id ta3ulha lama tnzed 3al
  // saved plants bynjeb l schedule ta3ula

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
        id: json['idplant'],
        name: json['name'],
        family: json['family'],
        description: json['description'],
        wateringScheduleId: json['watering'],
        image: json['image'],
        takingCare: json['takingCare'].toString().split("-"),
        howToPlant: json['howToPlant'].toString().split("-"));
  }

  static List<Plant> getAllPlants(List json) {
    return json.map((item) => Plant.fromJson(item)).toList();
  }
}

/*List<Plant> demoPlants = [
  Plant(id: 1,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: Schedule(),takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 2,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 3,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
];*/
