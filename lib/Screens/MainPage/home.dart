import 'package:flutter/material.dart';
import 'package:senior_project/classes/user.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather/weather.dart';
import 'package:senior_project/constants.dart';
import 'components/news.dart';
import 'components/weatherwidget.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Weather weather;
Size size;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return bodyContent(context);
  }

  @override
  void initState() {
    super.initState();
    getWeather();
    //_showNotification();
  }
}

Widget bodyContent(context) {
  size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.fromLTRB(
        size.width * 0.05, size.height * 0.08, size.width * 0.05, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        topMessageWidget,
        SizedBox(
          height: size.height * 0.03,
        ),
        SizedBox(
          height: size.height * 0.35,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage("assets/images/clear_sky.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: WeatherWidget(),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
            width: size.width,
            height: size.height * 0.09,
            child: NewsWidget(),
            decoration: BoxDecoration(
              boxShadow: [kBoxShadow],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            )),
        SizedBox(
          height: size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: size.width * 0.43,
                height: size.height * 0.18,
                child: agriculturalCalenderWidget,
                decoration: BoxDecoration(
                  boxShadow: [kBoxShadow],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                )),
            SizedBox(
              width: size.width * 0.04,
            ),
            Container(
                width: size.width * 0.43,
                height: size.height * 0.18,
                child: suggestionWidget,
                decoration: BoxDecoration(
                  boxShadow: [kBoxShadow],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                )),
          ],
        )
      ],
    ),
  );
}

Future<String> getWeather() async {
  String _cityName = 'Beirut';
  WeatherFactory wf = new WeatherFactory(API_KEY);
  weather = await wf.currentWeatherByCityName(_cityName);
  return weather.toString();
}

Widget get topMessageWidget {
  return RichText(
    text: TextSpan(
      text: 'Hello ',
      style: TextStyle(
        fontSize: 25.0,
        fontFamily: 'DMSerifText',
        letterSpacing: 1.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
            text: '${User.user.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFBF365A))),
        TextSpan(text: ',\nSuch a beautiful day!'),
      ],
    ),
  );
}

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: kPrimaryColor, width: 1),
            )),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => News()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/newspaper.png"),
            SizedBox(width: size.width * 0.02),
            Text(
              " What's new?",
              style: TextStyle(
                fontFamily: 'DMSerifText',
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 40.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget get agriculturalCalenderWidget {
  return TextButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(color: kPrimaryColor, width: 1),
    ))),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/calendar.png",
            height: size.height * 0.06,
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            "Agricultural calendars",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSerifText',
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget get suggestionWidget {
  return TextButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(color: kPrimaryColor, width: 1),
    ))),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/consulting.png",
            height: size.height * 0.06,
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            "Need a suggestion?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSerifText',
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}
/*
FlutterLocalNotificationsPlugin localNotification;

Future _showNotification() async {
  var androidInitialize =
      AndroidInitializationSettings('water_notification_icon');
  var iOSInitialize = IOSInitializationSettings();
  var initializationSettings =
      InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

  localNotification = FlutterLocalNotificationsPlugin();

  localNotification.initialize(initializationSettings);
  var androidDetails = AndroidNotificationDetails(
      "channelId", "Local Notification", "This is the description!",
      importance: Importance.high);
  var iOSDetails = IOSNotificationDetails();
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iOSDetails);

  await localNotification.show(
      0,
      'Water plant',
      'its time for you to water your plants',
      generalNotificationDetails
  );

  tz.initializeTimeZones();

  localNotification.zonedSchedule(1, "Task", "Scheduled notification",
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 15)),
      generalNotificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true);
}

 */
