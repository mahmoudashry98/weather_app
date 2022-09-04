import 'package:dio/dio.dart';
import 'package:weather_app/core/api/end_points.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherDataSource(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherDataSource(String cityName) async {
    var response =
        await Dio().get(EndPoint.weatherData + cityName + EndPoint.apiKey);
    //print(response.data);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
