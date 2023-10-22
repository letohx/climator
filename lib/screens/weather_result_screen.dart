import 'dart:io';

import 'package:climator/components/backround_decoration.dart';
import 'package:climator/components/border_icon.dart';
import 'package:climator/components/custom_button.dart';
import 'package:climator/components/weather_small_container.dart';
import 'package:climator/screens/search_screen.dart';
import 'package:climator/services/weather.dart';
import 'package:climator/utilities/constants.dart';
import 'package:climator/utilities/degree_to_direction.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class WeatherResult extends StatefulWidget {
  final Map<dynamic, dynamic>? weatherData;

  WeatherResult({this.weatherData});

  @override
  _WeatherResultState createState() => _WeatherResultState();
}

class _WeatherResultState extends State<WeatherResult> {
  WeatherModel weatherModel = WeatherModel();
  late String imageName;
  late String kCustomButtonString;
  late IconData locationOn;

  // final iconVal = 0xe3ab;
  // final familyValue = 'MaterialIcons';
  late int temperature;
  late String cityName;
  late String weatherMain;
  late int humidityValue;
  late double windSpeed;
  late int cond;
  late String windDirection;

  @override
  void initState() {
    kCustomButtonString = 'Made with ☃ By 🌀 Binni G. 🌀';
    settingNullValues();
    locationOn = const IconData(0xe3ab, fontFamily: 'MaterialIcons');
    updateLocationDetails(widget.weatherData);
    super.initState();
  }

  void settingNullValues() {
    temperature = 0;
    cityName = 'Lost in Space';
    weatherMain = 'Restart or \n See the Stars 🌟🌟';
    // weatherMain = 'Restart or \n See the Stars ';
    humidityValue = 0;
    windSpeed = 1000.0;
    windDirection = 'Nowhere';
    cond = 0;
    imageName = 'rain';
  }

  void updateLocationDetails(Map<dynamic, dynamic>? weatherData) async {
    if (weatherData == null) {
      settingNullValues();
    } else {
      cond = weatherData['weather'][0]['id'] as int;
      imageName = weatherModel.getWeatherIconName(cond);
      double temp = weatherData['main']['temp'] as double;
      temperature = temp.toInt();
      cityName = weatherData['name'] as String;
      String tempWeather = weatherData['weather'][0]['description'] as String;
      weatherMain = tempWeather.toUpperCase();
      humidityValue = weatherData['main']['humidity'] as int;
      var speedMeterPerSec = weatherData['wind']['speed']; //meter per seconds
      windSpeed = (speedMeterPerSec * 3.6).toInt().toDouble() as double;
      var windDegree = weatherData['wind']['deg'];
      print("type: ${windDegree.runtimeType}");
      windDirection = degToCompass(windDegree);
    }
  }

  bool _onWillPop(bool isPopInvoked) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('Yes'),
          ),
        ],
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: kBackgroundDecoration,
              constraints: BoxConstraints.expand(),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   height: 40,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final String typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SearchScreen();
                                },
                              ),
                            ) as String;
                            print('$typedName');
                            if (typedName != null) {
                              Map<dynamic, dynamic>? weatherData =
                                  await weatherModel.getCityWeatherData(
                                      typedName) as Map<dynamic, dynamic>?;

                              setState(() {
                                if (weatherData != null)
                                  updateLocationDetails(weatherData);
                                else {
                                  // Fluttertoast.showToast(
                                  //     msg: "City Not Found \nPlease try again",
                                  //     backgroundColor: Colors.red,
                                  //     toastLength: Toast.LENGTH_LONG,
                                  //     gravity: ToastGravity.CENTER,
                                  //     timeInSecForIosWeb: 1);
                                }
                              });
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 35,
                          ),
                        ),
                        BorderWithIcon(
                          colour: Colors.blue,
                          widget: Row(
                            children: [
                              Icon(
                                locationOn,
                                color: Colors.blue,
                              ),
                              // BorderWithIcon(iconData: locationOn, colour: Colors.blue),
                              Container(
                                child: Text(
                                  '$cityName',
                                  style: kCityTextStyle,
                                ),
                                padding: EdgeInsets.only(left: 2, top: 2),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Map<dynamic, dynamic>? weatherData =
                                await WeatherModel().getWeatherDataByLatLong()
                                    as Map<dynamic, dynamic>?;
                            setState(() {
                              updateLocationDetails(weatherData);
                            });
                          },
                          child: Icon(
                            Icons.refresh,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Today's Report",
                        style: kReportTitleTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                      height: 180,
                      image: AssetImage('images/weather_icons/$imageName.png'),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      '$weatherMain',
                      textAlign: TextAlign.center,
                      style: kWeatherMainTextStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$temperature',
                            style: kNumberTempTextStyle,
                          ),
                          Text(
                            '°',
                            style: kDegreeSign,
                          ),
                          Text(
                            'C',
                            style: kTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Expanded(child: GetIconContent(icon, value, text)),
                          Expanded(
                            child: WeatherDetailsWithIcon(
                              // iconText: 'Wind~~',
                              iconText: '☀☁',
                              detailText: '${windSpeed}km/hr',
                              labelText: 'Wind Speed',
                            ),
                          ),
                          Expanded(
                            child: WeatherDetailsWithIcon(
                              // iconText: 'Weather',
                              iconText: '🌧️',
                              detailText: '$humidityValue%',
                              labelText: 'Humidity',
                            ),
                          ),
                          Expanded(
                            child: WeatherDetailsWithIcon(
                              // iconText: 'Compass',
                              iconText: '🧭',
                              detailText: '$windDirection',
                              labelText: 'Wind Direction',
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: '$kCustomButtonString',
                      kBottomMargin: 10,
                      borderColor: Colors.blue[500]!,
                      textColor: Colors.blue,
                      onPressed: () async {
                        try {
                          String url =
                              "https://www.linkedin.com/in/binni-goel/";
                          await launchUrl(Uri.parse(url));
                        } catch (e) {
                          print("Error in launching url $e");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
