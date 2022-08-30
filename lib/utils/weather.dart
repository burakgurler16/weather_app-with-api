import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:weather/model/location.dart';
import 'package:weather/model/weather_model.dart';

const String apiKey = 'a444db179d1c4f7f3b4169f8cc39f837';

// class WeatherDisplayData {
//   Icon? weatherIcon;
//   WeatherDisplayData({
//     required this.weatherIcon,
//   });
// }

class WeatherData {
  WeatherData({
    this.latitude,
    this.longitude,
    this.dayInfo,
    required this.locationData,
  });
  double? latitude;
  double? longitude;

  double? temperature;
  String? locationPoint;
  String? currentCondition;

  Info? dayInfo;
  LocationHelper locationData;

  // Future<void> getLocationData() async {
  //   locationData = LocationHelper();
  //   await locationData.getCurrentLocation();

  //   if (locationData.latitude == null || locationData.longitude == null) {
  //   } else {
  //     latitude = locationData.latitude;
  //     longitude = locationData.longitude;
  //   }
  // }

  Future<void> getWeatherInfo() async {
    var path = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${apiKey}&units=metric&lang=tr');
    Response response = await get(path);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      dayInfo = Info.fromJson(data);

      try {
        currentCondition = data['weather'][0]['main'];
        locationPoint = dayInfo?.name;
        temperature = dayInfo?.main?.temp;
      } catch (e) {}
    } else {
      log('bağlantı hatası');
    }

    // WeatherDisplayData? getWeatherDisplayData() {
    //   if (currentCondition == 'cloud') {
    //     return WeatherDisplayData(
    //       weatherIcon: Icon(FontAwesomeIcons.cloud),
    //     );
    //   }
    // }
  }

  // Future<void> getLocationData() async {
  //   locationData = LocationHelper();
  //   await locationData.getCurrentLocation();

  //   if (locationData.latitude == null || locationData.longitude == null) {
  //   } else {
  //     latitude = locationData.latitude;
  //     longitude = locationData.longitude;
  //   }
  // }

  // Future<void> weatherInfo() async {
  //   var adres = Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${_apiKey}&units=metric&lang=tr');
  //   Response cevap = await get(adres);

  //   if (cevap.statusCode == 200) {
  //     Map gelenJson = jsonDecode(cevap.body);
  //     dayInfo = Info.fromJson(gelenJson);

  //     gelenCevap = gelenJson['weather'][0]['main'];

  //     // return gelenJson;
  //   } else {
  //     gelenCevap = 'bağlantı hatası';
  //   }
  // }

// }
}
