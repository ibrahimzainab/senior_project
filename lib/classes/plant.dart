import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

  void remindToWater(){
    for(int index=0;index<watering.length;index++)
    _showNotification(name,watering[index]);
  }
}

List<Plant> demoPlants = [
  Plant(id: 1,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 2,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 3,name: 'Apple',family: 'fruits', description: 'Details details details details details details details details details details details details details details details details details details details details details details details details.', watering: [DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,10,13)],takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
];

FlutterLocalNotificationsPlugin localNotification;

Future _showNotification(String plantName,DateTime time) async {
  var androidInitialize = AndroidInitializationSettings(
      'water_notification_icon');
  var iOSInitialize = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: androidInitialize, iOS: iOSInitialize);

  localNotification = FlutterLocalNotificationsPlugin();

  localNotification.initialize(initializationSettings);
  var androidDetails = AndroidNotificationDetails("channelId",
      "Local Notification",
      "This is the description!",
      importance: Importance.high
  );
  var iOSDetails = IOSNotificationDetails();
  var generalNotificationDetails = NotificationDetails(
      android: androidDetails, iOS: iOSDetails);

  tz.initializeTimeZones();

  /*
  await localNotification.show(
      0,
      'Water plant',
      'its time for you to water your plants',
      generalNotificationDetails
  );
   */
  await localNotification.zonedSchedule(
      1,
      "Water $plantName",
      "Scheduled notification",
      //tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      time,
      generalNotificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true
  );
}