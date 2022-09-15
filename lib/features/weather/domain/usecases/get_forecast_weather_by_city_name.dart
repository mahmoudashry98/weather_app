import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/usecase/base_uescase.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';

class GetForecastWeatherByCityNameUseCase
    extends BaseUseCase<WeatherEntities, WeatherParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetForecastWeatherByCityNameUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, WeatherEntities>> call(
      WeatherParameters parameters) async {
    return await baseWeatherRepository.getForcatWeatherByCityName(parameters);
  }
}

class WeatherParameters extends Equatable {
  final String? cityName;
  final int? day;
  final double? lat;
  final double? lon;

  const WeatherParameters({
    this.cityName,
    this.day,
    this.lat,
    this.lon,
  });
  @override
  List<Object?> get props => [
        cityName,
        day,
        lat,
        lon,
      ];
}
