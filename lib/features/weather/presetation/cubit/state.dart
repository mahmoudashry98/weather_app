import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/enum.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class AppState extends Equatable {
  final WeatherEntities? weatherEntities;
  final String weathertMessage;
  final RequestState weatherState;

  const AppState({
    this.weatherEntities,
    this.weathertMessage = '',
    this.weatherState = RequestState.loading,
  });

  AppState copyWith({
    WeatherEntities? weatherEntities,
    String? weathertMessage,
    RequestState? weatherState,
  }) {
    return AppState(
      weatherEntities: weatherEntities ?? this.weatherEntities,
      weatherState: weatherState ?? this.weatherState,
      weathertMessage: weathertMessage ?? this.weathertMessage,
    );
  }

  @override
  List<Object?> get props => [
        weatherEntities,
        weathertMessage,
        weatherState,
      ];



}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {}