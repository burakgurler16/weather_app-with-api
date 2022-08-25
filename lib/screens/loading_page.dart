import 'dart:developer';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:weather/model/location.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late LocationHelper locationData;

  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      log("Konum bilgileri gelmiyor.");
    } else {
      log("latitude: " + locationData.latitude.toString());
      log("longitude: " + locationData.longitude.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    String _appTitle = 'WEEKFO';
    return Scaffold(
      body: Container(
        decoration: myDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _appTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SpinKitPouringHourGlass(
              color: Colors.white,
              size: 150.0,
              duration: Duration(milliseconds: 12000),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration myDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.teal, Colors.limeAccent],
      ),
    );
  }
}
