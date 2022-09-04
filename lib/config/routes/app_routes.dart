import 'package:weather_app/features/weather/presetation/screens/weather_screen.dart';

class AppRouts {
  static const String initialRoute = '/';
  static const String homeScreen = '/HomeScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const WeatherScreen(),
  
};
