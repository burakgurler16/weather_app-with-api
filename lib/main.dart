import 'package:flutter/material.dart';
import 'package:weather/screens/loading_page.dart';
import 'package:weather/utils/weather_data.dart';

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
      home: LoadingPage(),
      // home: WeatherData(title: 'deneme 2'),
    );
  }
}
