import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {

  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    var androidInitialize = AndroidInitializationSettings('water_notification_icon.jpg');
    super.initState();
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future _showNotification() async{
    var androidDetails = AndroidNotificationDetails("channelId",
        "Local Notification",
        "This is the description!",
        importance: Importance.high
    );
    var iOSDetails = IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await localNotification.show(
        0,
        'Water plant',
        'its time for you to water your plants',
        generalNotificationDetails
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



