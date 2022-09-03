class Weather {
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


  Weather(
    this.id,
    this.cityName,
    this.main,
    this.description,
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.speed,
    this.clouds,
    this.sunrise,
    this.sunset,
  );
}

// class Weather {
//   List<Weather>? weather;
//   Main? main;
//   Wind? wind;
//   Clouds? clouds;
//   Sys? sys;
//   int? id;
//   String? name;
//   Weather({
//     this.weather,
//     this.main,
//     this.wind,
//     this.clouds,
//     this.sys,
//     this.id,
//     this.name,
//   });

//   Weather.fromJson(Map<String, dynamic> json) {
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(Weather.fromJson(v));
//       });
//     }
//     main = json['main'] != null ? Main.fromJson(json['main']) : null;

//     wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
//     clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;

//     sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;

//     id = json['id'];
//     name = json['name'];
//   }
// }

// class Weather1 {
//   String? main;
//   String? description;
//   Weather1({
//     this.main,
//     this.description,
//   });
//   Weather1.fromJson(Map<String, dynamic> json) {
//     main = json['main'];
//     description = json['description'];
//   }
// }

// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;
//   int? seaLevel;
//   int? grndLevel;
//   Main(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.humidity,
//       this.seaLevel,
//       this.grndLevel});

//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     seaLevel = json['sea_level'];
//     grndLevel = json['grnd_level'];
//   }
// }

// class Wind {
//   double? speed;
//   Wind({this.speed});

//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//   }
// }

// class Clouds {
//   int? all;
//   Clouds({this.all});
//   Clouds.fromJson(Map<String, dynamic> json) {
//     all = json['all'];
//   }
// }

// class Sys {
//   String? country;
//   int? sunrise;
//   int? sunset;
//   Sys({
//     this.country,
//     this.sunrise,
//     this.sunset,
//   });
//   Sys.fromJson(Map<String, dynamic> json) {
//     country = json['country'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
// }
