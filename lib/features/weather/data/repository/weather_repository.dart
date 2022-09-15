import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/data/datasource/remote_data_source.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, WeatherEntities>> getWeatherByCityName(WeatherParameters parameters) async {
    final result = await baseRemoteDataSource.getWeatherDataSource(parameters);

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

  @override
  Future<Either<Failure, WeatherEntities>> getForcatWeatherByCityName(WeatherParameters parameters) async {
    final result =
        await baseRemoteDataSource.getForecastDataSource(parameters);
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
