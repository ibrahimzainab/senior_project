import 'package:flutter/material.dart';

class Disease {
  int id;
  String name, description, whatToDo, imagePath;

  Disease(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.whatToDo,
      @required this.imagePath});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['idinsect'],
      name: json['name'],
      imagePath: json['imagePath'],
      description: json['description'],
      whatToDo: json['whatToDo'],
    );
  }

  static List<Disease> getInsects(List json) {
    return json.map((item) => Disease.fromJson(item)).toList();
  }
}
