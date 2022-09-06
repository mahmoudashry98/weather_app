import 'package:equatable/equatable.dart';

class WeatherEntities extends Equatable {
  final List<WeatherDay> weatherDay;
  final City city;

  const WeatherEntities({
    required this.weatherDay,
    required this.city,
  });

  @override
  List<Object?> get props => [
        weatherDay,
        city,
      ];
}

class WeatherDay extends Equatable {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final String dtTxt;

  const WeatherDay({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        dtTxt,
      ];
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}

class Weather extends Equatable {
  final int id;
  final String main;
  final String description;
  const Weather({
    required this.id,
    required this.main,
    required this.description,
  });
  @override
  List<Object?> get props => [
    id,
    main,
    description,
  ];
}

class Clouds extends Equatable {
  final int all;
  const Clouds({
    required this.all,
  });

  @override
  List<Object?> get props => [
        all,
      ];
}

class Wind extends Equatable {
  final double speed;
  final int deg;

  const Wind({
    required this.speed,
    required this.deg,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
      ];
}

class City extends Equatable {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int timezone;
  final int sunrise;
  final int sunset;
  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        timezone,
        sunrise,
        sunset,
      ];
}

class Coord extends Equatable {
  final double lat;
  final double lon;

  const Coord({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
