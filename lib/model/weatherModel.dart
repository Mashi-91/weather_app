class WeatherModel {
  String cityName;
  double cityTemperature;
  String mainCondition;

  WeatherModel({
    required this.cityName,
    required this.cityTemperature,
    required this.mainCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] as String,
      cityTemperature: json['main']['temp'] as double,
      mainCondition: json['weather'][0]['main'],
    );
  }
}
