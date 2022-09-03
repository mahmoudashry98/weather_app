import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double speed;
  final int clouds;
  final int sunrise;
  final int sunset;

  const Weather({
    required this.id,
    required this.cityName,
    required this.main,
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.speed,
    required this.clouds,
    required this.sunrise,
    required this.sunset,
  });
  
@override
  List<Object?> get props => [
        id,
        cityName,
        main,
        description,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        speed,
        clouds,
        sunrise,
        sunset,
      ];

 
}
