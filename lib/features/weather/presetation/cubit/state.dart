import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitialState extends AppState {}


class WeatherLoadedState extends AppState {}

class WeatherLoadingState extends AppState {}

class WeatherErrorState extends AppState {

    final String error;
  WeatherErrorState(this.error);
}
