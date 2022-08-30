import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:weather/model/location.dart';
import 'package:weather/model/weather_model.dart';

const String apiKey = 'a444db179d1c4f7f3b4169f8cc39f837';

class WeatherData {
  WeatherData({
    required this.locationData,
  });
  double? latitude;
  double? longitude;

  double? temperature;
  String? locationPoint;
  String? currentCondition;

  Info? dayInfo;
  LocationHelper? locationData;

  Future<void> getWeatherInfo() async {
    var path = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=tr');
    Response response = await get(path);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      dayInfo = Info.fromJson(data);

      try {
        currentCondition = data['weather'][0]['main'];
        locationPoint = dayInfo?.name;
        temperature = dayInfo?.main?.temp;
      } catch (e) {
        print(e);
      }
    } else {
      log('bağlantı hatası');
    }
  }
}
