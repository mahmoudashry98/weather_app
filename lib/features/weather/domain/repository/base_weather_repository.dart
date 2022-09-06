import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, WeatherEntities>> getWeatherByCityName(
      String cityName);
}
