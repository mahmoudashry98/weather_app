import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

import '../../../../core/error/failures.dart';

class GetWeatherByCityNameUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityNameUseCase(this.baseWeatherRepository);

  Future<Either<Failure, WeatherEntities>> execute(String cityName) async {
    return await baseWeatherRepository.getWeatherByCityName(cityName);
  }
}
