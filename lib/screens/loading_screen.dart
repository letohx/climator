import 'package:climator/screens/weather_result_screen.dart';
import 'package:climator/services/weather.dart';
import 'package:climator/utilities/constants.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentCoordinates();
  }

  void getCurrentCoordinates() async {
    // Fluttertoast.showToast(
    //     msg: "Fetching WeatherData....",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1);
    final Map<dynamic, dynamic>? weatherData = await WeatherModel().getCityWeatherData('London');
    // Fluttertoast.showToast(
    //     msg: "WeatherData Received",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return WeatherResult(
            weatherData: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: spinkit,
      ),
    );
  }
}
