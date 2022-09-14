
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntities {
  const WeatherModel({
    required super.location,
    required super.current,
    required super.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: LocationModel.fromJson(json["location"]),
        current: CurrentModel.fromJson(json["current"]),
        forecast: ForecastModel.fromJson(json["forecast"]),
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
        name: json["name"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
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
        tempC: json["temp_c"].toDouble(),
        windKph: json["wind_kph"].toDouble(),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"].toDouble(),
      );
}

class ForecastModel extends Forecast {
  const ForecastModel({
    required super.forecastday,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastday:  List<ForecastDayModel>.from(json["forecastday"].map((x) => ForecastDayModel.fromJson(x))),
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
        date: json["date"],
        dateEpoch: json["date_epoch"],
        day: DayModel.fromJson(json["day"]),
        astro: AstroModel.fromJson(json["astro"]),
        hour: List<HourModel>.from(
            json["hour"]?.map((x) => HourModel.fromJson(x))),
      );
}

class DayModel extends Day {
  const DayModel({
    required super.maxtempC,
    required super.mintempC,
    required super.dailyChanceOfRain,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxtempC: json["maxtemp_c"].toDouble(),
        mintempC: json["mintemp_c"].toDouble(),
        dailyChanceOfRain: json["daily_chance_of_rain"],
      );
}

class AstroModel extends Astro {
  const AstroModel({
    required super.sunrise,
    required super.sunset,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class HourModel extends Hour {
  const HourModel({
    required super.time,
    required super.tempC,
    required super.chanceOfRain,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        time: json["time"],
        tempC: json["temp_c"],
        chanceOfRain: json["chance_of_rain"],
      );
}
