import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';
import 'package:senior_project/classes/schedule.dart';

class SavedPlant {
  int id, idplant;
  String name, addedName;
  String date;
  String imagePath;
  List<Note> plantNotes;
  Schedule water;
  int watering;

  SavedPlant(
      {@required this.id,
      @required this.idplant,
      @required this.name,
      @required this.addedName,
      @required this.date,
      @required this.imagePath,
      @required this.watering,
      @required this.water,
      this.plantNotes});

  factory SavedPlant.fromJson(Map<String, dynamic> json) {
    return SavedPlant(
      id: json['idsavedPlant'],
      idplant: json['idplant'],
      name: json['name'],
      addedName: json['personalizedName'],
      watering: json['watering'],
      imagePath: json['imagePath'],
      date: json['dateOfPlanting'],
      water: Schedule(
        startDate: DateTime.parse(json['startDate']),
        frequencyInterval: json['frequencyInterval'],
        timeOfDay: TimeOfDay(
            hour: int.parse(json['timeOfDay'].split(":")[0]),
            minute: int.parse(json['timeOfDay'].split(":")[1])),
        endDate: DateTime.parse(json['endDate']),
      ),
    );
  }

  static List<SavedPlant> getAllPlants(List json) {
    return json.map((item) => SavedPlant.fromJson(item)).toList();
  }
}

/*List<SavedPlant> demoGardenPlants = [
  SavedPlant(
      id: 1,
      plantName: 'Tomato',
      addedName: 'My tomatoes',
      date: DateTime.now().toString().split(' ')[0]),
  SavedPlant(
      id: 2,
      plantName: 'Potato',
      addedName: 'My Potatoes',
      date: DateTime.now().toString().split(' ')[0]),
  SavedPlant(
      id: 3, plantName: 'Carrot', addedName: 'My carrots', date: '2020-02-14'),
  SavedPlant(
      id: 4,
      plantName: 'Cucumber',
      addedName: 'My cucumbers',
      date: DateTime.now().toString().split(' ')[0]),
  SavedPlant(
      id: 5,
      plantName: 'Apples',
      addedName: 'My apples',
      date: DateTime.now().toString().split(' ')[0]),
  SavedPlant(
      id: 6,
      plantName: 'Mushroom',
      addedName: 'My balcony mushrooms',
      date: DateTime.now().toString().split(' ')[0]),
  SavedPlant(
      id: 7,
      plantName: 'Banana',
      addedName: 'My bananas',
      date: DateTime.now().toString().split(' ')[0]),
];*/
