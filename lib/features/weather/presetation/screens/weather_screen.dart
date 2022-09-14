import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presetation/widgets/drawer.dart';
import '../../../../config/services/services_locator.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widgets/astro.dart';
import '../widgets/city_temp.dart';

import '../widgets/current_wind_and_humidity.dart';
import '../widgets/temp_5_days.dart';
import '../widgets/temp_all_hour_in_day.dart';

class HomeWeatherscreen extends StatelessWidget {
  const HomeWeatherscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          drawer: const Drawer(child: DrawerWidget()),
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 30,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                CityTempWidget(),
                SizedBox(
                  height: 20,
                ),
                TempAllHourInDay(),
                SizedBox(
                  height: 20,
                ),
                Temp5DaysWidget(),
                SizedBox(
                  height: 20,
                ),
                AstroWidget(),
                SizedBox(
                  height: 20,
                ),
                CurrentWindAndHumidity(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
