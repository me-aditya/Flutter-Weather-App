import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

Location location = new Location();
const String apiKey = '565b2883c54ac9bf1d0fb75c6b2b9957';

double latitude;
double longitude;

// String url =
//     "https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.08395287867832&appid=565b2883c54ac9bf1d0fb75c6b2b9957";

void getLocation() async {
  await location.getCurrentLocation();
  latitude = location.latitude;
  longitude = location.longitude;
}

String url =
    "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";

NetworkHelper networkHelper = new NetworkHelper(url);

var weatherData =  networkHelper.getData();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
