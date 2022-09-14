

import '../../features/current_location/current_location.dart';
import '../../features/search/search_scrren.dart';
import '../../features/weather/presetation/screens/weather_screen.dart';

class AppRouts {
  

  static const String initialRoute = '/';
  static const String homeScreen = '/home';
  static const String searchScreen = '/searchScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const CurrenLocation(),
  AppRouts.homeScreen: (context) => const HomeWeatherscreen(),
  AppRouts.searchScreen: (context) => const SearchScreen(),
};
