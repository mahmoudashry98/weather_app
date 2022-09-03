import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.id,
    super.cityName,
    super.main,
    super.description,
    super.temp,
    super.feelsLike,
    super.tempMin,
    super.tempMax,
    super.pressure,
    super.humidity,
    super.speed,
    super.clouds,
    super.sunrise,
    super.sunset
    
    
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => 
  WeatherModel(
    json['id'],
    json['name'],
    json['weather'][0]['main'],
    json['weather'][0]['description'],
    json['main']['temp'],
    json['main']['feelsLike'],
    json['main']['tempMin'],
    json['main']['tempMax'],
    json['main']['pressure'],
    json['main']['humidity'],
    json['wind']['speed'],
    json['clouds']['all'],
    json['sys']['sunrise'],
    json['sys']['sunset'],

  );
}
