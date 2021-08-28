import 'package:flutter/material.dart';

class Schedule {
  DateTime startDate;
  int frequencyInterval;
  TimeOfDay timeOfDay;
  DateTime endDate;

  Schedule({
    @required this.startDate,
    @required this.frequencyInterval,
    @required this.timeOfDay,
    @required this.endDate,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        startDate: json['startDate'],
        frequencyInterval: json['frequencyInterval'],
        timeOfDay: json['timeOfDay'],
        endDate: json['endTime']);
  }
}
