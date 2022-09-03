import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/data/datasource/remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName) async {
    final result = await baseRemoteDataSource.getWeatherDataSource(cityName);

    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return left(
        ServerFailure(
          message: failure.errorMessageModel.message,
        ),
      );
    }
  }
}
