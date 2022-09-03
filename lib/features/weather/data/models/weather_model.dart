import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.cityName,
    required super.main,
    required super.description,
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.speed,
    required super.clouds,
    required super.sunrise,
    required super.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json['id'],
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        speed: json['wind']['speed'],
        clouds: json['clouds']['all'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
      );

  
}
