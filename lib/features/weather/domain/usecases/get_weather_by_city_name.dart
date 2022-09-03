import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

import '../../../../core/error/failures.dart';

class GetWeatherByCityName {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByCityName(this.baseWeatherRepository);

  Future<Either<Failure, Weather>>  execute(String cityName) async {
    return await baseWeatherRepository.getWeatherByCityName(cityName);
  }
}
