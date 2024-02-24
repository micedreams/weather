import 'dart:convert';

class City {
  const City({
    required this.name,
    required this.temperature,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  final String name;
  final String temperature;
  final String weather;
  final String humidity;
  final String windSpeed;

  static City? fromJson(String data) {
    try {
      final dynamic map = jsonDecode(data);
      if (null == map || map is! Map) {
        return null;
      }

      final json = map.cast<String, dynamic>();

      final name = json['name'].toString();
      final temperature = json['main']['temp'].toString();
      final weather = json['weather'][0]['description'].toString();
      final humidity = json['main']['humidity'].toString();
      final windSpeed = json['wind']['speed'].toString();

      return City(
        name: name,
        temperature: temperature,
        weather: weather,
        humidity: humidity,
        windSpeed: windSpeed,
      );
    } on FormatException {
      return null;
    }
  }
}
