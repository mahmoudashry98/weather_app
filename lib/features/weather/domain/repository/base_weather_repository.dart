import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';

import '../../../../core/error/failures.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, WeatherEntities>> getWeatherByCityName(String cityName);

   Future<Either<Failure, WeatherEntities>> getForcatWeatherByCityName(WeatherParameters parameters);
}
