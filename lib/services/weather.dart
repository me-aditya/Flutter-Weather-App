import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const String apiKey = '565b2883c54ac9bf1d0fb75c6b2b9957';
String apiUrl = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = "${apiUrl}q=$cityName&appid=$apiKey";
    NetworkHelper networkHelper = new NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    String url =
        "${apiUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey";

    NetworkHelper networkHelper = new NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
