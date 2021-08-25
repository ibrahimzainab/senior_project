import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/date_formatter.dart';

import 'components/weatherwidget.dart';

Weather weather;

class Home extends StatefulWidget {
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
  }
}

Widget bodyContent(context) {
  Size size = MediaQuery.of(context).size;
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
          child: newsWidget,
        ),
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
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Container(
              width: size.width * 0.43,
              height: size.height * 0.18,
              child: suggestionWidget,
            ),
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
      children: const <TextSpan>[
        TextSpan(
            text: 'username',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFBF365A))),
        TextSpan(text: ',\nSuch a beautiful day!'),
      ],
    ),
  );
}

Widget get newsWidget {
  return TextButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.green, width: 1),
      )),
    ),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/newspaper.png"),
          SizedBox(width: 10),
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

Widget get agriculturalCalenderWidget {
  return TextButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(color: Colors.green, width: 1),
    ))),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/calendar.png",
            height: 50,
          ),
          SizedBox(height: 15),
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
      side: BorderSide(color: Colors.green, width: 1),
    ))),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/icons/consulting.png",
            height: 55,
          ),
          SizedBox(height: 15),
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
