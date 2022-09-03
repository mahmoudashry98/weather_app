class EndPoint {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '&appid=c6fc640741a8dc1dd3501bc61a2380df';

  static const String weatherData = '$baseUrl/weather?q=';
}
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}