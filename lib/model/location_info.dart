////// YOUTUBE VERSİON

class LocationInfo {
  String? name;

  LocationInfo.fromJson(Map json) {
    name = json['name'];
  }
}
