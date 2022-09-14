import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';

class EndPoint {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String baseUrl1 = 'https://api.weatherapi.com/v1';
  static const String apiKey = '&appid=bc74f05db9de01159b4d59a0d8ee6d30';
  static const String apiKey1 = '18feb1a29594439c943114715220409';
  static const String forecast = 'forecast.json?';

  static const String weatherData = '$baseUrl/forecast?q=';

  static const String weatherData1 = '$baseUrl1/forecast?q=';

  static String weatherDataPath(WeatherParameters parameters) =>
      '$baseUrl1/forecast.json?key=$apiKey1 &q=${parameters.cityName}&days=${parameters.day}&aqi=no&alerts=no';

  static String weatherDataPathByloc(WeatherParameters parameters) =>
      '$baseUrl1/forecast.json?key=$apiKey1 &q=${parameters.lat},${parameters.lon}&days=${parameters.day}&aqi=no&alerts=no';
}

///https://api.weatherapi.com/v1/forecast.json?key=18feb1a29594439c943114715220409 &q=fayoum&days=4&aqi=no&alerts=no
