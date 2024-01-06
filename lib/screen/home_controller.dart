import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:weather_app/repositories/weatherRepo.dart';

class HomeController extends GetxController {
  WeatherModel? weatherModel;

  @override
  void onInit() {
    _fetchWeather();
    super.onInit();
  }

  _fetchWeather() async {
    String cityName = await WeatherRepo.getCityLocation();

    try {
      final weather = await WeatherRepo.getWeather(cityName);
      weatherModel = weather;
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return "assets/sunny.json";
    }

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return "assets/cloudy.json";
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "assets/rain.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "clear":
        return "assets/sunny.json";
      default:
        return "assets/sunny.json";
    }
  }
}
