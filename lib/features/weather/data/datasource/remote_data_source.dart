import 'package:dio/dio.dart';
import 'package:weather_app/core/api/end_points.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/network/error_message_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherDataSource(WeatherParameters parameters);
  Future<WeatherModel> getForecastDataSource(WeatherParameters parameters);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherDataSource(WeatherParameters parameters) async {
    var response = await Dio().get(
        EndPoint.weatherDataPath(parameters));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<WeatherModel> getForecastDataSource(
      WeatherParameters parameters) async {
    var response = await Dio().get(EndPoint.weatherDataPathByloc(parameters));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
