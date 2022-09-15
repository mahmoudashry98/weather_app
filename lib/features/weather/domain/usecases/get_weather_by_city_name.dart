import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

import '../../../../core/error/failures.dart';
import 'get_forecast_weather_by_city_name.dart';

class GetWeatherByCityNameUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityNameUseCase(this.baseWeatherRepository);

  Future<Either<Failure, WeatherEntities>> call(WeatherParameters parameters) async {
    return await baseWeatherRepository.getWeatherByCityName(parameters);
  }
}


