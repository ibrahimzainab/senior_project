import 'package:flutter/material.dart';

class Insect {
  int id;
  String name, family, description, whatToDo, imagePath;

  Insect(
      {@required this.id,
      @required this.name,
      @required this.family,
      @required this.description,
      @required this.whatToDo,
      @required this.imagePath});

  factory Insect.fromJson(Map<String, dynamic> json) {
    return Insect(
        id: json['idinsect'],
        name: json['name'],
        family: json['family'],
        imagePath: json['imagePath'],
        description: json['description'],
        whatToDo: json['whatToDo'],
        );
  }

  static List<Insect> getInsects(List json) {
    return json.map((item) => Insect.fromJson(item)).toList();
  }
}
