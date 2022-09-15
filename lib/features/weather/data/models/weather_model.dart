import 'package:weather_app/core/utils/app_string.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntities {
  const WeatherModel({
    required super.location,
    required super.current,
    required super.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: LocationModel.fromJson(json[AppString.location]),
        current: CurrentModel.fromJson(json[AppString.current]),
        forecast: ForecastModel.fromJson(json[AppString.forecast]),
      );
}

class LocationModel extends Location {
  const LocationModel({
    required super.name,
    required super.country,
    required super.lat,
    required super.lon,
    required super.localtimeEpoch,
    required super.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json[AppString.cityName],
        country: json[AppString.country],
        lat: json[AppString.lat].toDouble(),
        lon: json[AppString.lon].toDouble(),
        localtimeEpoch: json[AppString.localtimeEpoch],
        localtime: json[AppString.localtime],
      );
}

class CurrentModel extends Current {
  const CurrentModel({
    required super.tempC,
    required super.windKph,
    required super.humidity,
    required super.cloud,
    required super.feelslikeC,
  });
  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        tempC: json[AppString.temp].toDouble(),
        windKph: json[AppString.wind].toDouble(),
        humidity: json[AppString.humidity],
        cloud: json[AppString.clouds],
        feelslikeC: json[AppString.feelsLike].toDouble(),
      );
}

class ForecastModel extends Forecast {
  const ForecastModel({
    required super.forecastday,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastday: List<ForecastDayModel>.from(
          json[AppString.forecastday].map((x) => ForecastDayModel.fromJson(x))),
    );
  }
}

class ForecastDayModel extends Forecastday {
  const ForecastDayModel({
    required super.date,
    required super.dateEpoch,
    required super.day,
    required super.astro,
    required super.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      ForecastDayModel(
        date: json[AppString.date],
        dateEpoch: json[AppString.dateEpoch],
        day: DayModel.fromJson(json[AppString.day]),
        astro: AstroModel.fromJson(json[AppString.astro]),
        hour: List<HourModel>.from(
            json[AppString.hour]?.map((x) => HourModel.fromJson(x))),
      );
}

class DayModel extends Day {
  const DayModel({
    required super.maxtempC,
    required super.mintempC,
    required super.dailyChanceOfRain,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxtempC: json[AppString.tempMax].toDouble(),
        mintempC: json[AppString.tempMin].toDouble(),
        dailyChanceOfRain: json[AppString.dailyChanceOfRain],
      );
}

class AstroModel extends Astro {
  const AstroModel({
    required super.sunrise,
    required super.sunset,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json[AppString.sunrise],
        sunset: json[AppString.sunset],
      );
}

class HourModel extends Hour {
  const HourModel({
    required super.time,
    required super.tempC,
    required super.chanceOfRain,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        time: json[AppString.time],
        tempC: json[AppString.temp],
        chanceOfRain: json[AppString.chanceOfRain],
      );
}
