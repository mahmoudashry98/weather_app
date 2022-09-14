import 'package:equatable/equatable.dart';

class WeatherEntities extends Equatable {
  final Location location;
  final Current current;
  final Forecast forecast;

  const WeatherEntities({
    required this.location,
    required this.current,
    required this.forecast,
  });

  @override
  List<Object?> get props => [
        location,
        current,
        forecast,
      ];
}

class Location extends Equatable {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final int localtimeEpoch;
  final String localtime;

  const Location({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtimeEpoch,
    required this.localtime,
  });
  @override
  List<Object?> get props => [
        name,
        country,
        lat,
        lon,
        localtimeEpoch,
        localtime,
      ];
}

class Current extends Equatable {
  final double tempC;

  final double windKph;
  final int humidity;
  final int cloud;
  final double feelslikeC;

  const Current({
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
  });
  @override
  List<Object?> get props => [
        tempC,
        windKph,
        humidity,
        cloud,
        feelslikeC,
      ];
}

class Forecast extends Equatable {
  final List<Forecastday> forecastday;
  
  const Forecast({
    required this.forecastday,
  });
  @override
  List<Object?> get props => [
        forecastday,
      ];
}

class Forecastday extends Equatable {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  const Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        day,
        astro,
        hour,
      ];
}

class Day extends Equatable {
  final double maxtempC;
  final double mintempC;
  final int dailyChanceOfRain;

  const Day({
    required this.maxtempC,
    required this.mintempC,
    required this.dailyChanceOfRain,
  });
  @override
  List<Object?> get props => [
        maxtempC,
        mintempC,
        dailyChanceOfRain,
      ];
}

class Astro extends Equatable {
  final String sunrise;
  final String sunset;

  const Astro({
    required this.sunrise,
    required this.sunset,
  });
  @override
  List<Object?> get props => [
        sunrise,
        sunset,
      ];
}

class Hour extends Equatable {
  final String time;
  final double tempC;
  final int chanceOfRain;

  const Hour({
    required this.time,
    required this.tempC,
    required this.chanceOfRain,
  });
  @override
  List<Object?> get props => [
        time,
        tempC,
        chanceOfRain,
      ];
}
