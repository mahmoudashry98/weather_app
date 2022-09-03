import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/core/api/end_points.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherDataSource(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherDataSource(String cityName) async {
    try {
      var response = await Dio().get(
        '${EndPoint.baseUrl}/weather?q=$cityName&appid=$EndPoint.apiKey',
      );
      print(response);

      return WeatherModel.fromJson(json.decode(response.data));
    } catch (e) {
      print(e);
    }

    return null;
  }
}
