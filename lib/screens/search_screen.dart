import 'package:climator/components/custom_button.dart';
import 'package:climator/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/blur_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Text(
                      'Search For New City!!',
                      style: kReportTitleTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                // Text(
                //   'Enter City Name!!',
                //   textAlign: TextAlign.center,
                //   style: kWeatherMainTextStyle,
                // ),
                Image(
                  height: 180,
                  image: AssetImage('images/weather_icons/breeze.png'),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Enter City Name',
                  style: kCityNameTextStyle,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                    // decoration: kTextFieldInputDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10.0),
                  child: CustomButton(
                    text: 'Get Weather',
                    textColor: Colors.red,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    kBottomMargin: 0,
                    borderColor: Colors.red,
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
