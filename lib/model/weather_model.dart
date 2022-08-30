class Info {
  List<Weather>? weather;
  Main? main;
  String? name;

  Info.fromJson(Map json) {
    weather = (json['weather'] ?? []).map((e) => Weather.fromJson(e)).toList().cast<Weather>();
    main = Main.fromJson(json['main']);
    name = json['name'];
  }
}

class Weather {
  int? id;
  String? main;
  String? description;

  Weather.fromJson(Map json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
  }
}

class Main {
  late final double temp;

  Main.fromJson(Map json) {
    temp = json['temp'];
  }
}



















///** 
/// AUTOGENERATE
///
///**/

// class Info {
//   Info({
//     required this.weather,
//     required this.main,
//     required this.name,
//   });

//   late final List<Info> weather;
//   late final String name;
//   late final Main main;

//   Info.fromJson(Map<String, dynamic> json) {
//     weather = List.from(json['weather']).map((e) => Info.fromJson(e)).toList();
//     main = Main.fromJson(json['main']);
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['weather'] = weather.map((e) => e.toJson()).toList();
//     _data['main'] = main.toJson();
//     _data['name'] = name;

//     return _data;
//   }
// }

// class Weather {
//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });
//   late final int id;
//   late final String main;
//   late final String description;
//   late final String icon;

//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['main'] = main;
//     _data['description'] = description;
//     _data['icon'] = icon;
//     return _data;
//   }
// }

// class Main {
//   Main({
//     required this.temp,
//     required this.humidity,
//   });
//   late final double temp;
//   late final int humidity;
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     humidity = json['humidity'];
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['temp'] = temp;
//     _data['humidity'] = humidity;
//     return _data;
//   }
// }
