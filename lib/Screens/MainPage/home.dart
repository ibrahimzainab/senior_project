import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:senior_project/constants.dart';
import 'package:senior_project/date_formatter.dart';

Weather weather;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return bodyContent(context);
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }
}

Widget bodyContent (context){
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.fromLTRB(size.width*0.03, size.height*0.04, size.width*0.03, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        topMessageWidget,
        SizedBox(
          height: size.height*0.03,
        ),
        SizedBox(
          height: size.height*0.426,
          child: Container(
            child: WeatherWidget(),
          ),
        ),
        SizedBox(height: size.height*0.03),
        SizedBox(
          width: size.width,
          height: size.height*0.09,
          child: newsWidget,
        ),
        SizedBox(
          height: size.height*0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size.width*0.44,
              height: size.height*0.16,
              child: agriculturalCalenderWidget,
            ),
            SizedBox(
              width: size.width*0.05,
            ),
            SizedBox(
              width: size.width*0.44,
              height: size.height*0.16,
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

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<String>(
        future: getWeather(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            Row city = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(children: <Widget>[
                  Text(
                    weather.areaName,
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                    ),
                  ),
                ]),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      getWeather();
                    });
                  },
                ),
              ],
            );
            Row date = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                    Text(DateFormatter.date(weather.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        )
                    ),
              ],
            );
            Row temperature = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(weather.temperature.toString(),
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.black87,
                        ))
                  ],
                ),
              ],
            );
            Row description = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //TODO: place image of weather cond
                SizedBox(width: 9),
                Text(weather.weatherDescription,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                    )),
              ],
            );
            double maxWindSpeed = 25.0;
            final wind = LinearProgressIndicator(
              backgroundColor: Colors.white24,
              value: weather.windSpeed / maxWindSpeed,
            );
            double maxPressure = 1058.0;
            final pressurec = LinearProgressIndicator(
              backgroundColor: Colors.white24,
              value: weather.pressure / maxPressure,
            );
            final humidityc = LinearProgressIndicator(
              backgroundColor: Colors.white24,
              value: weather.humidity / 100.0,
            );
            Row other = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text("Wind",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 12),
                              Text(weather.windSpeed.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 10),
                              Text("m/s",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 7),
                              SizedBox(
                                height: 2,
                                width: 80,
                                child: wind,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text("Pressure",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 12),
                              Text(weather.pressure.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 10),
                              Text("hPa",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 7),
                              SizedBox(
                                height: 2,
                                width: 80,
                                child: pressurec,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text("Humidity",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 12),
                              Text(weather.humidity.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 10),
                              Text("%",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: 7),
                              SizedBox(
                                height: 2,
                                width: 80,
                                child: humidityc,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
            Container container = Container(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    city,
                    date,
                    temperature,
                    description,
                    other
                  ],
                ),
              ),
            );
            return container;
          } else {
            return SizedBox(
              width: size.width,
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

Widget get topMessageWidget {
  return Text(
    'Hello username,\nit seems cold today!',
    style: TextStyle(
      fontSize: 30.0,
      fontFamily: 'DMSerifText',
      letterSpacing: 1.0,
    ),
  );
}

Widget get newsWidget {
  return TextButton.icon(
    icon: Icon(
      Icons.web,
      size: 50.0,
      color: Colors.white,
    ),
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(12.0),
      shadowColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      )),
    ),
    onPressed: () {},
    label: Text(
      " What's new?",
      style: TextStyle(
        fontFamily: 'DMSerifText',
        color: Colors.white,
        letterSpacing: 1.0,
        fontSize: 40.0,
      ),
    ),
  );
}

Widget get agriculturalCalenderWidget {
  return TextButton(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(12.0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ))),
    onPressed: () {},
    child: Column(
      children: <Widget>[
        Text(
          "Agricultural calender",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'DMSerifText',
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 10.0),
        Icon(
          Icons.calendar_today,
          size: 40.0,
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget get suggestionWidget {
  return TextButton(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(12.0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ))),
    onPressed: () {},
    child: Column(
      children: <Widget>[
        Text(
          "Need a suggestion?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'DMSerifText',
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Icon(
          Icons.lightbulb,
          size: 40.0,
          color: Colors.white,
        ),
      ],
    ),
  );
}
