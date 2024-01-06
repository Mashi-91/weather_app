import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/const/const.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  static Future<WeatherModel?> getWeather(String cityName) async {
    try {
      final res = await http.get(Uri.parse(
          '${Const.WeatherUrl}?q=$cityName&appid=${Const.WeatherAPI}&units=metric'));

      if (res.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(res.body));
      } else {
        log('Something Gone Wrong');
        throw Exception('Something Gone Wrong');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String> getCityLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemark[0].locality;
    return city ?? "";
  }
}
