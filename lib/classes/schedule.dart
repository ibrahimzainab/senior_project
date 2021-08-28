import 'package:flutter/material.dart';

class Schedule {
  DateTime startDate;
  int frequencyInterval;
  DateTime timeOfDay;
  DateTime endTime;

  Schedule({
    @required this.startDate,
    @required this.frequencyInterval,
    @required this.timeOfDay,
    @required this.endTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        startDate: json['startDate'],
        frequencyInterval: json['frequencyInterval'],
        timeOfDay: json['timeOfDay'],
        endTime: json['endTime']);
  }
}
