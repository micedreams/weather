import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'city_model.dart';

const appId = '4ea954340b3ce2fe5f46a36ed6fcad9c';

Future getWeather(String city) async {
  final url = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
    'q': city,
    'appid': appId,
    'units': 'metric',
  });

  try {
    final response = await http.get(url);

    final body = jsonDecode(response.body);
    if (body['cod'] == 200) {
      final details = City.fromJson(response.body);

      return details;
    } else {
      return body['message'];
    }
  } on SocketException {
    return 'SocketException';
  } on Exception {
    return Exception;
  }
}
