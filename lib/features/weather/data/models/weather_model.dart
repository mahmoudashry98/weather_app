
import 'package:weather_app/features/weather/domain/entities/weather.dart';


class WeatherModel extends WeatherEntities {
  const WeatherModel({
    required super.weatherDay,
    required super.city,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    
    return WeatherModel(
        weatherDay: List<WeatherDayModel>.from(json["list"].map((x) => WeatherDayModel.fromJson(x))),
        
        city: CityModel.fromJson(json['city']));
  }
}


class WeatherDayModel extends WeatherDay {
  const WeatherDayModel({
    required super.dt,
    required super.main,
    required super.weather,
    required super.clouds,
    required super.wind,
    required super.dtTxt,
  });
  factory WeatherDayModel.fromJson(Map<String, dynamic> json) {
    
    return WeatherDayModel(
      dt: json['dt'],
      main: MainModel.fromJson(json['main']),
      weather: List<MainWeatherModel>.from(json["weather"].map((x) => MainWeatherModel.fromJson(x))),
      clouds: CloudsModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json["wind"]),
      dtTxt: json['dt_txt'],
    );
  }
}

class MainModel extends Main {
  const MainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class MainWeatherModel extends Weather {
  const MainWeatherModel({
    required super.id,
    required super.main,
    required super.description,
  });

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return MainWeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
    );
  }
}

class CloudsModel extends Clouds {
  const CloudsModel({
    required super.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(
      all: json['all'],
    );
  }
}

class WindModel extends Wind {
  const WindModel({
    required super.speed,
    required super.deg,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json["speed"].toDouble(),
      deg: json['deg'],
    );
  }
}

class CityModel extends City {
  const CityModel({
    required super.id,
    required super.name,
    required super.coord,
    required super.country,
    required super.timezone,
    required super.sunrise,
    required super.sunset,
  });
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: CoordModel.fromJson(json['coord']),
      country: json['country'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class CoordModel extends Coord {
  const CoordModel({
    required super.lat,
    required super.lon,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
