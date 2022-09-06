import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_by_city_name.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

class AppCubit extends Cubit<AppState> {
  final GetWeatherByCityNameUseCase getWeatherByCityNameUseCase;
  AppCubit(this.getWeatherByCityNameUseCase) : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  

  void getWeather() async {
    emit(WeatherLoadingState());

    final result = await getWeatherByCityNameUseCase
        .execute('fayoum')
        .then(
          (value) => {
            print(value),
            emit(
              WeatherLoadedState(),
            ),
          },
        )
        .catchError((e) {
      emit(WeatherErrorState(e.toString()));
    });
  }
}
