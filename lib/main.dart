import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/model/location_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Api deneme Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _gelenCevap;
  double? latitude = 40.2763;
  double? longitude = 29.1035;
  String? apiKey = 'a444db179d1c4f7f3b4169f8cc39f837';

  LocationInfo? _locationInfo;

  Future<void> _incrementCounter() async {
    var adres = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    Response cevap = await get(adres);

    if (cevap.statusCode == 200) {
      Map _gelenJson = jsonDecode(cevap.body);
      _locationInfo = LocationInfo.fromJson(_gelenJson);

      _gelenCevap = _gelenJson['name'];
    } else {
      _gelenCevap = 'bağlantı hatası';
    }
    setState(() {});
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
          Text(_locationInfo?.name ?? 'name null'),
          Text(
            '$_gelenCevap',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
