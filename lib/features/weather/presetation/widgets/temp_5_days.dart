import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/core/utils/enum.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/widgets/custom_text.dart';

class Temp5DaysWidget extends StatelessWidget {
  const Temp5DaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.weatherState != current.weatherState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.weatherState) {
          case RequestState.loading:
            print('loading');
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return Container(
              height: context.height * 0.4,
              width: context.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView.builder(
                  itemCount: state.weatherEntities!.forecast.forecastday.length,
                  itemBuilder: (context, index) {
                    var date =
                        state.weatherEntities!.forecast.forecastday[index].date;
                    var parsedDate = DateTime.parse(date);
                    var dateTime = DateTime.now();
                    var inDay = DateFormat('EEEE').format(dateTime);
                    var myDate = DateFormat('EEEE').format(parsedDate);
                    return Row(
                      children: [
                        CustomText(
                          text: myDate == inDay ? 'Today' : myDate,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        Image.asset(
                          height: 40,
                          width: 30,
                          humidityIcon,
                        ),
                        CustomText(
                          text:
                              '  ${state.weatherEntities!.forecast.forecastday[index].day.dailyChanceOfRain}%',
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          height: 40,
                          width: 30,
                          sunIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          height: 40,
                          width: 30,
                          crescentIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text:
                              '${(state.weatherEntities!.forecast.forecastday[index].day.maxtempC).toInt()}° '
                              '${(state.weatherEntities!.forecast.forecastday[index].day.mintempC).toInt()}°',
                          color: AppColors.textBlack,
                          size: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(
                child: CustomText(
                  text: state.weathertMessage,
                ),
              ),
            );
        }
      },
    );
  }
}
