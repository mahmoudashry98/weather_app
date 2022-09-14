import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/utils/enum.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_weather_by_city_name.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_by_city_name.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

class AppCubit extends Cubit<AppState> {
  final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;
  final GetForecastWeatherByCityNameUseCase getForecastWeatherByCityName;

  AppCubit(
    this.getWeatherByCityNameUseCase,
    this.getForecastWeatherByCityName,
  ) : super(const AppState());

  static AppCubit get(context) => BlocProvider.of(context);

  // Future getWeather(searchController) async {
  //   final result = await getWeatherByCityNameUseCase(searchController);
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         weatherState: RequestState.error,
  //         weathertMessage: l.message,
  //       ),
  //     ),
  //     (r) {
  //       emit(
  //         state.copyWith(
  //           weatherEntities: r,
  //           weatherState: RequestState.loaded,
  //         ),
  //       );
  //     },
  //   );
  // }

  TextEditingController searchController = TextEditingController();

  Future getForcastWeather() async {
    final result = await getWeatherByCityNameUseCase(searchController.text);
    result.fold(
      (l) {
        print('-------------$l----------');
        emit(
          state.copyWith(
            weatherState: RequestState.error,
            weathertMessage: l.message,
          ),
        );
      },
      (r) {
        print(searchController.text);
        print('-------------$r----------');
        emit(
          state.copyWith(
            weatherEntities: r,
            weatherState: RequestState.loaded,
          ),
        );
      },
    );
  }

  Future getDefaultForcastWeather(double? lat, lon) async {
    final result = await getForecastWeatherByCityName(
        WeatherParameters(lat: lat, lon: lon, day: 7));
    result.fold(
      (l) => emit(
        state.copyWith(
          weatherState: RequestState.error,
          weathertMessage: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            weatherEntities: r,
            weatherState: RequestState.loaded,
          ),
        );
      },
    );
  }

}
