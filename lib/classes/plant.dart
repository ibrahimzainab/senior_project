import 'package:flutter/material.dart';
import 'package:senior_project/classes/note.dart';

class Plant{
  int id;
  String plantName,addedName;
  String date;
  String displayImage;
  List<String> images;
  List<Note> plantNotes;

  Plant({
    @required this.id,
    @required this.plantName,
    this.addedName,
    @required this.date,
    this.plantNotes
  });

}

List<Plant> demoPlants = [
  Plant(id: 1, plantName: 'Tomato', addedName: 'My tomatoes', date: DateTime.now().toString().split(' ')[0]),
  Plant(id: 2, plantName: 'Potato', addedName: 'My Potatoes', date: DateTime.now().toString().split(' ')[0]),
  Plant(id: 3, plantName: 'Carrot', addedName: 'My carrots', date: '2020-02-14'),
  Plant(id: 4, plantName: 'Cucumber', addedName: 'My cucumbers', date: DateTime.now().toString().split(' ')[0]),
  Plant(id: 5, plantName: 'Apples', addedName: 'My apples', date: DateTime.now().toString().split(' ')[0]),
  Plant(id: 6, plantName: 'Mushroom', addedName: 'My balcony mushrooms', date: DateTime.now().toString().split(' ')[0]),
  Plant(id: 7, plantName: 'Banana', addedName: 'My bananas', date: DateTime.now().toString().split(' ')[0]),
];