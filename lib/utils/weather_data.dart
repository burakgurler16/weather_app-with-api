import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/model/location.dart';
import 'package:weather/model/weather_model.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  String? gelenCevap;
  double? latitude;
  double? longitude;

  final String _apiKey = 'a444db179d1c4f7f3b4169f8cc39f837';

  Info? dayInfo;
  late LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
    } else {
      latitude = locationData.latitude;
      longitude = locationData.longitude;
    }
  }

  Future<Map?> weatherInfo() async {
    setState(() async {
      var adres = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${_apiKey}&units=metric&lang=tr');
      Response cevap = await get(adres);

      if (cevap.statusCode == 200) {
        Map gelenJson = jsonDecode(cevap.body);
        dayInfo = Info.fromJson(gelenJson);

        gelenCevap = gelenJson['weather'][0]['main'];
      } else {
        gelenCevap = 'bağlantı hatası';
      }
    });
  }

  Future<void> _incrementCounter() async {
    var adres = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${_apiKey}&units=metric&lang=tr');
    Response cevap = await get(adres);

    if (cevap.statusCode == 200) {
      Map _gelenJson = jsonDecode(cevap.body);
      dayInfo = Info.fromJson(_gelenJson);

      gelenCevap = _gelenJson['weather'][0]['main'];
    } else {
      gelenCevap = 'bağlantı hatası';
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          const Text(
            'Gelen Cevap',
          ),
          Text(dayInfo?.name ?? 'name null'),
          Text(dayInfo?.main?.temp.toString() ?? 'temp null'),
          Text(
            '$gelenCevap',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: weatherInfo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
