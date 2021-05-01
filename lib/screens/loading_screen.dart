import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Location location = new Location();
const String apiKey = '565b2883c54ac9bf1d0fb75c6b2b9957';

String url =
    "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey";

// String url =
//     "https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.08395287867832&appid=565b2883c54ac9bf1d0fb75c6b2b9957";

void getLocation() async {
  await location.getCurrentLocation();
}

void getData() async {
  http.Response response = await http.get(Uri.parse(url));
  String data = response.body;
  var longitude = jsonDecode(data)["coord"]["log"];
  var latitude = jsonDecode(data)["coord"]["lat"];

  print(latitude);
}

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
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
