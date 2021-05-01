import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';

void getLocation() async {
  Location location = new Location();
  await location.getCurrentLocation();
  print(location.latitude);
  print(location.longitude);
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
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
