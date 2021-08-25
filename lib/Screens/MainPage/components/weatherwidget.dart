import 'package:flutter/material.dart';
import 'package:senior_project/date_formatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../home.dart';

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
                      fontSize: 30,
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
                Column(
                  children: <Widget>[
                    Text(DateFormatter.date(weather.date),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        )),
                  ],
                ),
              ],
            );
            Row temperature = Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.02),
                    Text(weather.temperature.toString(),
                        style: TextStyle(
                          fontSize: 50,
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
                SizedBox(width: size.width * 0.01),
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
                    SizedBox(height: size.height * 0.02),
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
                              SizedBox(height: size.height * 0.01),
                              Text(weather.windSpeed.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.01),
                              Text("m/s",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.02),
                              SizedBox(
                                height: size.height * 0.0025,
                                width: size.width * 0.18,
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
                              SizedBox(height: size.height * 0.01),
                              Text(weather.pressure.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.01),
                              Text("hPa",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.02),
                              SizedBox(
                                height: size.height * 0.0025,
                                width: size.width * 0.18,
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
                              SizedBox(height: size.height * 0.01),
                              Text(weather.humidity.toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.01),
                              Text("%",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  )),
                              SizedBox(height: size.height * 0.02),
                              SizedBox(
                                height: size.height * 0.0025,
                                width: size.width * 0.18,
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
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 50.0,
                ));
          }
        });
  }
}
