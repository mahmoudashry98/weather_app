import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/datasource/remote_data_source.dart';
import 'package:weather_app/features/weather/data/repository/weather_repository.dart';
import 'package:weather_app/features/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_by_city_name.dart';

import '../../features/weather/presetation/cubit/cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Cubit
    sl.registerFactory(() => AppCubit(sl(), sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetWeatherByCityNameUseCase(sl()));
    sl.registerLazySingleton(() => GetForecastWeatherByCityNameUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseWeatherRepository>(
        () => WeatherRepository(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
