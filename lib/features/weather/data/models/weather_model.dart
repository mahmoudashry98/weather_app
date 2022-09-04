import 'package:weather_app/core/utils/app_string.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.timezone,
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
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json[AppString.id],
        timezone: json[AppString.timezone],
        cityName: json[AppString.cityName],
        main: json[AppString.weather][0][AppString.main],
        description: json[AppString.weather][0][AppString.description],
        temp: json[AppString.main][AppString.temp],
        feelsLike: json[AppString.main][AppString.feelsLike],
        tempMin: json[AppString.main][AppString.tempMin],
        tempMax: json[AppString.main][AppString.tempMax],
        pressure: json[AppString.main][AppString.pressure],
        humidity: json[AppString.main][AppString.humidity],
        speed: json[AppString.wind][AppString.speed],
        clouds: json[AppString.clouds][AppString.all],
        country: json[AppString.sys][AppString.country],
        sunrise: json[AppString.sys][AppString.sunrise],
        sunset: json[AppString.sys][AppString.sunset],
      );

  
}
