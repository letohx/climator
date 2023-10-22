import 'package:climator/services/location.dart';
import 'package:climator/services/networking.dart';

class WeatherModel {
  getWeatherDataByLatLong() async {
    var weatherData;
    Locations locations = Locations();
    await locations.getCoordinates();

    weatherData = await Networks()
        .getDataByLatLong(locations.longitude, locations.latitude);

    return weatherData;
  }

  getCityWeatherData(String city) async {
    var weatherData;
    weatherData = await Networks().getDataByCity('$city');
    // print(weatherData['weather'][0]['id']);
    return weatherData;
  }

  String getWeatherIconName(int condition) {
    if (condition < 300) {
      return 'moon_lightning';
    } else if (condition < 400) {
      return 'cloud_rain';
    } else if (condition < 600) {
      return 'rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'breeze';
    } else if (condition == 800) {
      return 'clear_sun';
    } else if (condition <= 804) {
      return 'clear_cloud';
    } else {
      return 'night_cloud';
    }
  }
}
